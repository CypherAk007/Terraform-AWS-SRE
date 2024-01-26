output "public_IP" {
  value = aws_instance.myec2.public_ip
}

output "public_dns" {
  value = aws_instance.myec2.public_dns
}