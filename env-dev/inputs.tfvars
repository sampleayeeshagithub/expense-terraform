env = "dev"

vpc_cidr         = "10.0.0.0/16"
public_subnets   = ["10.0.0.0/24", "10.0.1.0/24"]
private_subnets  = ["10.0.2.0/24", "10.0.3.0/24"]
azs              = ["us-east-1a", "us-east-1b"]

default_vpc_id   = "vpc-0c863870f98908e1b"
default_vpc_cidr = "172.31.0.0/16"
default_route_table_id = "rtb-06e19adf24654cd7f"
account_no       = "299627189740"
bastion_node_cidr= [ "172.31.29.231/32" ]