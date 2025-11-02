module "terraform-netlify" {
  source = "./modules/repository"

  name        = "terraform-netlify"
  description = "Manage Netlify resources using Terraform"
  topics = [
    "terraform",
    "netlify",
  ]

  required_checks = [
    {
      context        = "Terraform format check"
      integration_id = 15368
    },
    {
      context        = "Terraform Cloud/matijs/repo-id-ryohofGxm6tLFpKk"
      integration_id = 39328
    },
    {
      context        = "no-fixups"
      integration_id = 15368
    }
  ]
}
