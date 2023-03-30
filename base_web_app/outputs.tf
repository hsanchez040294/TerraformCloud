output "Hostname" {
  description = "IP publica del servicio:"
  #value = "http://${aws_instance.nginx1.public_dns}"
  value = "http://${aws_lb.nginx.dns_name}"

}