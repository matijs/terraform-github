module "no-fixups-action" {
  source = "../modules/repository"

  name         = "no-fixups-action"
  description  = "GitHub Action that can be used as a blocking status check when there are 'amend!', 'fixup!', or 'squash!' commits in a pull request"
  homepage_url = "https://github.com/matijs/no-fixups-action?tab=readme-ov-file#no-fixups-action"
  topics = [
    "amend",
    "autosquash",
    "commit",
    "fixup",
    "git",
    "github-action",
    "pull-request",
    "rebase",
    "squash",
  ]

  # github_repository_ruleset required_status_checks
  required_checks = [
    {
      context        = "ShellCheck"
      integration_id = 15368
    },
    {
      context        = "Dogfooding"
      integration_id = 15368
    }
  ]

}
