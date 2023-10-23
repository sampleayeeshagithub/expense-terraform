env = "prod"

vpc_cidr         = "10.255.0.0/16"
public_subnets   = ["10.255.0.0/24", "10.255.1.0/24"]
private_subnets  = ["10.255.2.0/24", "10.255.3.0/24"]
azs              = ["us-east-1a", "us-east-1b"]

default_vpc_id   = "vpc-0c863870f98908e1b"
default_vpc_cidr = "172.31.0.0/16"
default_route_table_id = "rtb-06e19adf24654cd7f"
account_no       = "299627189740"
bastion_node_cidr= [ "172.31.29.231/32" ]

desired_capacity = 2
max_size         = 10
min_size         = 2
instance_class   = "db.t3.medium"
prometheus_cidr  = [ "172.31.20.245/32" ]
kms_key_id       = "arn:aws:kms:us-east-1:299627189740:key/20d4c346-4cde-4977-b03b-c758bef825a5"