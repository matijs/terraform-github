module "lab-probablerobot-net" {
  source = "./modules/repository"

  name         = "lab.probablerobot.net"
  description  = "Source code for https://lab.probablerobot.net"
  homepage_url = "https://lab.probablerobot.net"

  # github_repository_ruleset required_status_checks
  required_checks = [
    {
      context        = "lint"
      integration_id = 15368
    },
    {
      context        = "no-fixups"
      integration_id = 15368
    },
    {
      context        = "CodeQL"
      integration_id = 57789
    }
  ]
}
