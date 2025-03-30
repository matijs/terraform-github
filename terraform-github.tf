module "terraform-github" {
  source = "./modules/repository"

  name        = "terraform-github"
  description = "Create GitHub repositories using Terraform"
  topics = [
    "terraform",
    "github",
  ]

  required_checks = [
    {
      context        = "Terraform format check"
      integration_id = 15368
    },
    {
      context        = "Terraform Cloud/matijs/repo-id-G6r89aYrVaCsUhv5"
      integration_id = 39328
    },
    {
      context        = "no-fixups"
      integration_id = 15368
    }
  ]
}
