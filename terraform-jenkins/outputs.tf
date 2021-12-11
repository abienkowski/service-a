# -- --
# -- output variables of interest
output "eip_jenkins" {
  description = "Elastic IP that should be assoccicated with Jenkins VM"
  value       = aws_eip.jenkins_eip_zone_1.public_ip
}
output "ssh_connection" {
  description = "To view the served image please paste the IP into your browser"
  value       = format("ssh -i %s ubuntu@%s","<path to aws ssh key>",aws_eip.jenkins_eip_zone_1.public_ip)
}
