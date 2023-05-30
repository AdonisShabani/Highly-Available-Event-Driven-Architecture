terraform {
  backend "remote" {
    workspaces { prefix = "serverless-" }
    hostname     = "app.terraform.io"
    organization = "adonis1995"
  }
}