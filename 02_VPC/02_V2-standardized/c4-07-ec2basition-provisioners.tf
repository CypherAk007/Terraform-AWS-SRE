# Copy the pem(private key) to ec2 and connect it 
# Create null resource and provisioner 
resource "null_resource" "copy_ec2_keys" {
  depends_on = [ module.ec2_public ]
#   connection block to connect to ec2 instance
  connection {
    type = "ssh"
    host = aws_eip.bastion_eip.public_ip
    user = "ec2-user"
    password = ""
    private_key = file("private-key/eks-terraform-key.pem")
  }
#   File provisioner copies key.pem file to bation host ec2 -> /tmp/eks-terraform-key.pem
  provisioner "file" {
    source = "private-key/eks-terraform-key.pem"
    destination = "/tmp/eks-terraform-key.pem"
  }
  
#   Remote EXEC Provisioner : Using remote-exec Provisioner fix the private key permissions
# if we want to connect to bation host ec2 we need ssh permisions : chmod 400 we do that fm here. 
  provisioner "remote-exec" {
    inline = [ "sudo chmod 400 /tmp/eks-terraform-key.pem" ]
  }

#   Local EXEC provisioner (exec during creation time or destroy time of the resource)
    # *****NOT RELATED TO ABOVE EC2 - ONLY LEARNING PURPOSE****
    provisioner "local-exec" {
        # get vpc id of vm and store it locally in a file
      command = "echo VPC created on `date` and VPC ID: ${module.vpc.vpc_id} >> creation-time-vpc-id.txt "
    #   mention a dir to store this file 
      working_dir = "local-exec-output-files"
    }
}