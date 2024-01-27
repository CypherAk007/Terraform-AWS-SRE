variable "key_pair" {
  default = "terraform-key"
}

variable "awsRegion" {
  type = string
  default = "us-east-1"
}
variable "instance_type_list" {
  type = list(string)
  default = ["t2.micro","t3.micro"]
}

variable "instance_type_map" {
  type = map(string)
  default = {
    dev = "t2.micro",
    prod = "t3.micro",
    qa = "t2.micro"

  }
}