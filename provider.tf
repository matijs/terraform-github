terraform {
  required_version = ">= 0.10"

  cloud {
    organization = "matijs"

    workspaces {
      name = "github"
    }
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.9.0"
    }
  }
}

provider "github" {
  token = var.GITHUB_TOKEN
}
