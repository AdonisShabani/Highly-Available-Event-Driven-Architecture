data "terraform_remote_state" "compute" {
  backend = "remote"

  config = {
    workspaces   = { name = "compute-${var.environment}" }
    hostname     = "app.terraform.io"
    organization = "adonis1995"
  }
}