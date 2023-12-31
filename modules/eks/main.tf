resource "aws_eks_cluster" "main" {
  name     = "${var.env}-${var.project_name}"
  role_arn = aws_iam_role.main.arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }
}

resource "null_resource" "aws-auth" {
  depends_on = [aws_eks_cluster.main]
  provisioner "local-exec" {
    command = <<EOF
aws eks update-kubeconfig --name ${var.env}-${var.project_name}
aws-auth upsert --mapusers --userarn arn:aws:iam::299627189740:user/ayeesha --username ayeesha --groups system:masters
EOF
  }
}

resource "aws_eks_node_group" "main" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "${var.env}-${var.project_name}-ng"
  node_role_arn   = aws_iam_role.node.arn
  subnet_ids      = var.subnet_ids
  instance_types  = var.instance_types


  scaling_config {
    desired_size = var.node_count
    max_size     = var.node_count
    min_size     = var.node_count
  }
}

#resource "aws_eks_identity_provider_config" "main" {
#  cluster_name = aws_eks_cluster.main.name

#  oidc {
#    client_id                     = split("/", aws_eks_cluster.main.identity[0].oidc[0].issuer)[4]
#    identity_provider_config_name = "oidc"
#    issuer_url                    = aws_eks_cluster.main.identity[0].oidc[0].issuer
#  }
#}

