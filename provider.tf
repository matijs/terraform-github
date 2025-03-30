terraform {
  required_version = "~> 1.11.0"

  cloud {
    organization = "matijs"

    workspaces {
      name = "github"
    }
  }
}

provider "github" {
  token = var.GITHUB_TOKEN
}
