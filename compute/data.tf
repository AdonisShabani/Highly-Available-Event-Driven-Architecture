data "terraform_remote_state" "networking" {
  backend = "remote"

  config = {
    workspaces   = { name = "networking-${var.environment}" }
    hostname     = "app.terraform.io"
    organization = "adonis1995"
  }
}

data "terraform_remote_state" "domain" {
  backend = "remote"

  config = {
    workspaces   = { name = "domain-${var.environment}" }
    hostname     = "app.terraform.io"
    organization = "adonis1995"
  }
}
