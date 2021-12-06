# -- --
# -- define ssh access to resources
resource "aws_key_pair" "ssh-key" {
    key_name = "abienkow"
    public_key = file("${var.public_key_path}")

    tags = {
      Name = "${var.vpc_name}-abienkow"
    }
}
