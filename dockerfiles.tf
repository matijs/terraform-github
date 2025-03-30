module "dockerfiles" {
  source = "./modules/repository"

  name        = "dockerfiles"
  description = "Dockerfiles"

  required_checks = [
    {
      context        = "no-fixups"
      integration_id = 15368
    }
  ]
}
