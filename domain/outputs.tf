output "acm_certificate_arn" {
  description = "The ARN of the certificate"
  value       = module.acm.acm_certificate_arn
}

output "route53_hosted_zone" {
  description = "The zone ID of Adonis hosted zone"
  value       = aws_route53_zone.zone
}