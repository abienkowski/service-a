# -- --
# -- security groups for jenkins
resource "aws_security_group" "jenkins_sg" {
    name        = "jenkins-sg"
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
        from_port        = 8080
        to_port          = 8080
        protocol         = "tcp"
    }

    ingress {
        cidr_blocks      = [
          "0.0.0.0/0",
        ]
        description      = "http access "
        from_port        = 443
        to_port          = 443
        protocol         = "tcp"
    }

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

    tags = {
      Name = "jenkins-sg"
    }
}

