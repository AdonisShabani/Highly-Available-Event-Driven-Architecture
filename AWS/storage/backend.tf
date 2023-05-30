terraform {
  backend "remote" {
    workspaces { name = "storage" }
    hostname     = "app.terraform.io"
    organization = "adonis1995"
  }
}