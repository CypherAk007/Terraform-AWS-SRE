variable "aws_region" {
    type = string
    description = "AWS Region"
    default = "us-east-1"
}

variable "instance_type" {
  default = "t2.micro"
}   

variable "instance_keypair" {
  description = "AWS EC@ Key Pair"
  type = "string"
  default = "terraform-key"
}
