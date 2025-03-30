module "til" {
  source = "./modules/repository"

  name        = "til"
  description = "Today I Learned"

  required_checks = [
    {
      context        = "prettier-check",
      integration_id = 15368
    },
    {
      context        = "no-fixups"
      integration_id = 15368
    }
  ]
}

