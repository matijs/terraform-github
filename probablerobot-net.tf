module "probablerobot-net" {
  source = "./modules/repository"

  name         = "probablerobot.net"
  description  = "Source code for https://probablerobot.net"
  homepage_url = "https://probablerobot.net"

  # github_repository_ruleset required_status_checks
  required_checks = [
    {
      context        = "lint"
      integration_id = 15368 # GitHub Actions
    },
    {
      context        = "no-fixups"
      integration_id = 15368 # Github Actions
    },
    {
      context        = "CodeQL"
      integration_id = 57789 # GitHub Advanced Security
    },
    {
      context        = "zizmor"
      integration_id = 57789 # GitHub Advanced Security
    }
  ]
}
