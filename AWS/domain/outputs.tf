output "acm_certificate_arn" {
  description = "The ARN of the certificate"
  value       = module.acm.acm_certificate_arn
}

output "route53_hosted_zone" {
  description = "The zone ID of Adonis hosted zone"
  value       = module.adonis_hosted_zone.route53_zone_zone_id
}