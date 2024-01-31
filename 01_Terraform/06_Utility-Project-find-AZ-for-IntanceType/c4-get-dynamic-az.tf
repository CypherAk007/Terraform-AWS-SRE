# 1->Get list of az in a spefic region (region in us-east-1 configured by the provider)
# DataSource-1
data "aws_availability_zones" "my_azones" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

# DataSource
data "aws_ec2_instance_type_offerings" "my_ins_type" {
#   for_each = toset(["us-east-1a","us-east-1b","us-east-1e"])
  for_each = toset(data.aws_availability_zones.my_azones.names)
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

# Gives list of az with instancetype in it if that az is avail... or empty list 
output "all_az_mapped_Instance_types" {
  value = {
    for az,details in data.aws_ec2_instance_type_offerings.my_ins_type:
    az=>details.instance_types 
  }
}

# Gives list of az with instancetype in it if that az is avail...
output "all_az_mapped_Instance_types_only_accepted_az" {
  value = {
    for az,details in data.aws_ec2_instance_type_offerings.my_ins_type:
    az=>details.instance_types if length(details.instance_types)!=0
  }
}


# Gives list of az with instancetype in it if that az is avail... **List Format**
# using Keys()
output "all_az_mapped_Instance_types_only_accepted_az_list" {
  value = keys({
    for az,details in data.aws_ec2_instance_type_offerings.my_ins_type:
    az=>details.instance_types if length(details.instance_types)!=0
  })
}

# pick 1st val fm list 
output "all_az_mapped_Instance_types_only_accepted_az_list_1st_val" {
  value = keys({
    for az,details in data.aws_ec2_instance_type_offerings.my_ins_type:
    az=>details.instance_types if length(details.instance_types)!=0
  })[0]
}

# o/p->
# + all_az_mapped_Instance_types_only_accepted_az_list         = [
#       + "us-east-1a",
#       + "us-east-1b",
#       + "us-east-1c",
#       + "us-east-1d",
#       + "us-east-1f",
#     ]