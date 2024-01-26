output "public_IP" {
  value = aws_instance.myec2.public_ip.value
}

# output "public_dns" {
#   value = 
# }