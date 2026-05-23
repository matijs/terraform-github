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
      integration_id = 15368 # GitHub Actions
    },
    {
      context        = "Terraform Cloud/matijs/repo-id-G6r89aYrVaCsUhv5"
      integration_id = 39328 # Terraform Cloud
    },
    {
      context        = "no-fixups"
      integration_id = 15368 # GitHub Actions
    },
    {
      context        = "zizmor"
      integration_id = 57789 # GitHub Advanced Security
    }
  ]
}
