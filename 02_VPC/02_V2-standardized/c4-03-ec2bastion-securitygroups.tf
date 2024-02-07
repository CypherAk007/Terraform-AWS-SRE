module "public_bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name        = "${local.name}-public_bastion_sg"
  description = "Security group for SSH Port open for everybody (IPv4 CIDR)"
  vpc_id      = module.vpc.vpc_id

  ingress_rules = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
#   egressRules all-all open
  egress_rules = ["all-all"] 
  tags = local.common_tags

}