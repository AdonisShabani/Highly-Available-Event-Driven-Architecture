data "terraform_remote_state" "networking" {
  backend = "remote"

  config = {
    workspaces   = { name = "networking-${var.environment}" }
    hostname     = "app.terraform.io"
    organization = "adonis1995"
  }
}
