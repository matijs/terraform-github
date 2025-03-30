module "lab-probablerobot-net" {
  source = "./modules/repository"

  name         = "lab.probablerobot.net"
  description  = "Source code for https://lab.probablerobot.net"
  homepage_url = "https://lab.probablerobot.net"

  # github_repository_ruleset required_status_checks
  required_checks = [
    {
      context        = "deploy/netlify"
      integration_id = 13473
    },
    {
      context        = "no-fixups"
      integration_id = 15368
    },
  ]
}
