# -- --
# -- this file defines bastion deployment in Classic Infrastructure
resource "aws_instance" "nginx" {

  ami = data.aws_ami.ubuntu1804.id
  instance_type = "t2.micro"

# -- NOTE: this does not solve the problem of assocciation of eip
# -- it assigns a different public ip to the instance
#associate_public_ip_address = true

  # -- vpc subnet
  subnet_id = "${aws_subnet.dmzin_zone_1.id}"

  # -- security groups
  vpc_security_group_ids = [
    aws_security_group.nginx_sg.id
  ]

  # -- ssh key for provisioning
  key_name = "${aws_key_pair.ssh-key.id}"

  tags = {
    Name = "${var.vpc_name}-nginx"
  }
}
# -- -- 
# -- allocated public IP to access service
resource "aws_eip" "nginx_eip_zone_1" {
  vpc = true

  instance = aws_instance.nginx.id

  tags = {
    Name = "${var.vpc_name}-nginx_eip"
  }
}
# -- --
# -- assocciate eip with nginx VM
resource "aws_eip_association" "nginx_eip" {
  instance_id   = aws_instance.nginx.id
  allocation_id = aws_eip.nginx_eip_zone_1.id

  depends_on = [
    aws_eip.nginx_eip_zone_1,
    aws_instance.nginx
  ]
}
