module "probablerobot-net" {
  source = "./modules/repository"

  name         = "probablerobot.net"
  description  = "Source code for https://probablerobot.net"
  homepage_url = "https://probablerobot.net"

  # github_repository_ruleset required_status_checks
  required_checks = [
    {
      context = "deploy/netlify"
    },
    {
      context = "check"
    },
    {
      context = "no-fixups"
    },
  ]
}
