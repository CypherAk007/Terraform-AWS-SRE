# output - for loop with list o/p the list
output "for_output_list" {
  description = "For Loop with List"
  value = [for instance in aws_instance.myec2: instance.public_dns]
}

# output - for loop with map
output "for_output_map" {
  description = "For Loop with Map"
  value = {for instance in aws_instance.myec2: instance.id=>instance.public_dns}
}

# output - for loop with Map Advanced we the index of instance
output "for_output_map_adv" {
  description = "For Loop with Map - Advanced"
  value = {for c,instance in aws_instance.myec2: c=>instance.public_dns}
}

# legacy splat operator - display multiple ec2 if count=x in ec2 
output "legacy_splat_publicdns" {
  description = "Legacy Splat Operator"
  value = aws_instance.myec2.*.public_dns
}


# latest splat operator - display multiple ec2 if count=x in ec2 
output "latest_splat_publicdns" {
  description = "latest Splat Operator"
  value = aws_instance.myec2[*].public_dns
}