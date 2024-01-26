resource "aws_instance" "myec2" {
  ami = data.aws_ami.amxLinux2.id 
#   instance_type = "t2.micro"
  instance_type = var.instance_type
  user_data = file("${path.module}/app1-install.sh")
#   key_name = aws_key_pair.mykey.key_name
  key_name = var.instance_keypair
  vpc_security_group_ids = [
    aws_security_group.vpc-ssh.id,
    aws_security_group.vpc-web.id
    ] 
  tags ={
    Name ="Myec2AmiDS"
  }
}