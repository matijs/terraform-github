module "terraform-netlify" {
  source = "./modules/repository"

  name        = "terraform-netlify"
  description = "Manage Netlify resources using Terraform"
  topics = [
    "terraform",
    "netlify",
  ]
}
