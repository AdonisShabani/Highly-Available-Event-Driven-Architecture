data "terraform_remote_state" "private_zone_id" {
  backend = "remote"

  config = {
    workspaces   = { name = "hive-domain-${var.environment}" }
    hostname     = "app.terraform.io"
    organization = "brainstorm-global"
  }
}