# -- --
# -- this file defines bastion deployment in Classic Infrastructure
resource "aws_instance" "nginx" {

    ami = "${lookup(var.ami, var.region)}"
    instance_type = "t2.micro"

    # VPC
    subnet_id = "${aws_subnet.dmzin_zone_1.id}"

    # Security Group
    vpc_security_group_ids = [
      aws_security_group.nginx_sg.id
    ]

    # -- ssh key for provisioning
    key_name = "${aws_key_pair.ssh-key.id}"
}
# -- -- 
# -- allocated IP for access to VM
resource "aws_eip" "nginx_zone_1" {
  vpc = true
}
# -- --
# -- assocciate eip with nginx VM
resource "aws_eip_association" "nginx_eip" {
  instance_id   = aws_instance.nginx.id
  allocation_id = aws_eip.nginx_zone_1.id
}
