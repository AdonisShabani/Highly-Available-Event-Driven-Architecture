# resource "aws_route53_zone" "hosted_zone" {
#   name = "adonisshabani.info"

#   lifecycle {
#     prevent_destroy = false
#   }
# }

data "aws_route53_zone" "hosted_zone" {
  private_zone = false
  zone_id      = "Z055730626EDU97HD80IC"
}