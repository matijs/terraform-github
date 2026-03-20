module "renovate-config" {
  source = "./modules/repository"

  name        = "renovate-config"
  description = "Renovate configuration"

  required_checks = [
    {
      context        = "no-fixups"
      integration_id = 15368
    }
  ]
}
