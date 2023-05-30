terraform {
  backend "remote" {
    workspaces { prefix = "storage-" }
    hostname     = "app.terraform.io"
    organization = "adonis1995"
  }
}