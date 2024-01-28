# DataSource
data "aws_ec2_instance_type_offerings" "my_ins_type2" {
  for_each = toset(["us-east-1a","us-east-1b","us-east-1e"])
  filter {
    name   = "instance-type"
    values = [ "t3.micro"]
  }

  filter {
    name   = "location"
    values = [each.key]
  }

  location_type = "availability-zone"
}


# Output of for each is in for loop
output "output_v2_1" {
#   value = data.aws_ec2_instance_type_offerings.my_ins_type1.instance_types
    value = toset([for t in data.aws_ec2_instance_type_offerings.my_ins_type2: t.instance_types])
}
# + output_v2_1 = [
#       + [
#           + "t3.micro",
#         ],
#       + [],
#     ]

# OUtput map az-> instance_type
output "output_v2_2" {
  value = {
    for az,details in data.aws_ec2_instance_type_offerings.my_ins_type2: az=>details.instance_types
  }
}
# + output_v2_2 = {
#       + us-east-1a = [
#           + "t3.micro",
#         ]
#       + us-east-1b = [
#           + "t3.micro",
#         ]
#       + us-east-1e = []

