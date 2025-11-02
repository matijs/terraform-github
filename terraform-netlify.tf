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
      context        = "Terraform Cloud/matijs/repo-id-ryohofGxm6tLFpKk"
      integration_id = 39328
    }
  ]
}
