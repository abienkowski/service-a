# -- --
# -- output variables of interest
output "eip_nginx" {
  description = "Elastic IP that should be assoccicated with nginx VM"
  value       = aws_eip.nginx_eip_zone_1.public_ip
}
output "ssh_connection" {
  description = "To view the served image please paste the IP into your browser"
  value       = format("ssh -i %s ubuntu@%s",var.private_key_path,aws_instance.nginx.public_ip)
}
