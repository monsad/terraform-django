data "aws_vpc" "app_vpc" {
  id = var.vpc_id[0]
}

data "aws_subnets" "app_subnet" {
  filter {
    name = "vpc-id"
    values = [data.aws_vpc.app_vpc.id]
  }
}

data "aws_security_groups" "app_sg" {
  filter {
    name   = "group-name"
    values = ["default"]
  }

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.app_vpc.id]
  }
}
