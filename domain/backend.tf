terraform {
  backend "remote" {
    workspaces { prefix = "domain-" }
    hostname     = "app.terraform.io"
    organization = "adonis1995"
  }
}