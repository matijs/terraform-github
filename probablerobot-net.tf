module "probablerobot-net" {
  source = "./modules/repository"

  name         = "probablerobot.net"
  description  = "Source code for https://probablerobot.net"
  homepage_url = "https://probablerobot.net"

  # github_repository_ruleset required_status_checks
  required_checks = [
    #{
    #  context        = "Header rules"
    #  integration_id = 13473
    #},
    #{
    #  context        = "Pages changed"
    #  integration_id = 13473
    #},
    #{
    #  context        = "Redirect rules"
    #  integration_id = 13473
    #},
    {
      context        = "check"
      integration_id = 15368
    },
    {
      context        = "no-fixups"
      integration_id = 15368
    }
  ]
}
