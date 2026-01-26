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
      version = "6.10.2"
    }
  }
}

provider "github" {
  token = var.GITHUB_TOKEN
}
