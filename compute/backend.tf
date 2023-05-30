terraform {
  backend "remote" {
    workspaces { prefix = "compute-"}
    hostname     = "app.terraform.io"
    organization = "adonis1995"
  }
}