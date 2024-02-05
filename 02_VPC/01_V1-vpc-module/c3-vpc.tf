module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.5.1"

#   VPC Basic Details - Copy from Github

  name = "vpc-dev"
  cidr = "10.0.0.0/16"
#   az's 
  azs                 = ["us-east-1a","us-east-1b"]
#   subnets
  private_subnets     = ["10.0.1.0/24","10.0.2.0/24"]
  public_subnets      = ["10.0.101.0/24","10.0.102.0/24"]

#   database - subnets , routetable, subnet group
# optional nat gateway route, db internet gw route
  create_database_subnet_group = true 
  create_database_subnet_route_table = true 
  database_subnets    = ["10.0.151.0/24","10.0.152.0/24"]
#   create_database_internet_gateway_route = true
# create_database_nat_gateway_route = true

#   nat g/w outbound comm for private subnet
enable_nat_gateway = true
single_nat_gateway = true
# vpc dns parameters - hostnames, support
enable_dns_hostnames = true
enable_dns_support = true

# public subnet tags 
public_subnet_tags = {
    Type  = "public-subnets"
}
# private subnet tags 
private_subnet_tags = {
    Type = "private-subnets"
}
# db subnet tags 
database_subnet_tags = {
    Type = "database-subnets"
}

# tags - Argument 
tags = {
    Owner = "abhishek"
    Environment = "dev"
}
# vpc_tags ref from module
vpc_tags = {
    Name = "vpc-dev"
}

}