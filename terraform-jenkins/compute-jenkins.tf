# -- --
# -- this file defines bastion deployment in Classic Infrastructure
resource "aws_instance" "jenkins" {

  ami = data.aws_ami.ubuntu1804.id
  instance_type = "t2.micro"

# -- NOTE: this does not solve the problem of assocciation of eip
# -- it assigns a different public ip to the instance
#associate_public_ip_address = true

  # -- security groups
  vpc_security_group_ids = [
    aws_security_group.jenkins_sg.id
  ]

  # -- ssh key for provisioning
  key_name = var.key_name

  tags = {
    Name = "jenkins"
  }
}
# -- -- 
# -- allocated public IP to access service
resource "aws_eip" "jenkins_eip_zone_1" {
  vpc = true

  instance = aws_instance.jenkins.id

  tags = {
    Name = "jenkins"
  }
}
# -- --
# -- assocciate eip with Jenkins VM
resource "aws_eip_association" "jenkins-eip" {
  instance_id   = aws_instance.jenkins.id
  allocation_id = aws_eip.jenkins_eip_zone_1.id
}
