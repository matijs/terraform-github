terraform {
  required_version = "~> 1.10.0"

  cloud {
    organization = "matijs"

    workspaces {
      name = "github"
    }
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.4.0"
    }
  }
}

provider "github" {
  token = var.GITHUB_TOKEN
}
