# -- --
# -- security groups for nginx
resource "aws_security_group" "nginx_sg" {
    vpc_id      = aws_vpc.vpc.id
    name        = "${var.vpc_name}-nginx-sg"
    description = "SSH ,HTTP"

    # -- -- -- --
    egress {
      cidr_blocks      = [
        "0.0.0.0/0",
      ]
      description      = "default egress enables all outgoing traffic; for testing only, not recommanded for production"
      from_port        = 0
      protocol         = "-1"
      to_port          = 0
      self             = false
    }

    # -- -- -- --
    ingress {
        cidr_blocks      = [
          "0.0.0.0/0",
        ]
        description      = "http access "
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
    }

    ingress {
        cidr_blocks      = [
          "0.0.0.0/0",
        ]
        description      = "ssh access"
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
    }
}

