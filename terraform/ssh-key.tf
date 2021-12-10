# -- --
# -- define ssh access to resources
data "aws_key_pair" "ssh-key" {
    key_name = var.key_name
#    filter {
#      name = "tag:Name"
#      values = ["jenkins"]
#    }
}
