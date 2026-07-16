module "renovate-config" {
  source = "./modules/repository"

  name        = "renovate-config"
  description = "Renovate configuration"

  required_checks = [
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
