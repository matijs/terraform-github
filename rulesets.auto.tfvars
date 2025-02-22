rulesets = {
  "til" = {
    rules = {
      required_signatures = true
    }
  },
  "github-terraform" = {
    rules = {
      pull_request = {
        require_code_owner_review = true
      }

      required_signatures = true
      required_status_checks = {
        required_check = [
          {
            context        = "Terraform format check"
            integration_id = 15368
          },
          {
            context        = "Terraform Cloud/matijs/repo-id-xTdtApDiyNBVUu6g"
            integration_id = 39328
          },
          {
            context        = "no-fixups"
            integration_id = 15368
          },
          {
            context        = "CodeQL"
            integration_id = 57789
          },
        ]
      }
    }
  },
  "probablerobot.net" = {
    rules = {
      required_signatures = true
      required_status_checks = {
        required_check = [
          {
            context        = "deploy/netlify"
            integration_id = 13473
          },
          {
            context        = "check"
            integration_id = 15368
          },
          {
            context        = "no-fixups"
            integration_id = 15368
          },
        ]
      }
    }
  },
  "lab.probablerobot.net" = {
    rules = {
      required_status_checks = {
        required_check = [
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
    }
  },
  "no-fixups-action" = {
    rules = {
      required_signatures = true
      required_status_checks = {
        required_check = [
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
    }
  },
  "dockerfiles" = {
    rules = {
      required_status_checks = {
        required_check = [
          { context = "no-fixups" }
        ]
      }
    }
  }
}
