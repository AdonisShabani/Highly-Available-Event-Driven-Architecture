output "lb_dns_name" {
  description = "DNS name of the Load Balancer"
  value = aws_lb.lb.dns_name
}

output "lb_zone_id"{
    description = "ID of the Load Balancer"
    value = aws_lb.lb.zone_id
}