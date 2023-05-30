terraform {
  backend "remote" {
    workspaces { prefix = "networking-" }
    hostname     = "app.terraform.io"
    organization = "adonis1995"
  }
}