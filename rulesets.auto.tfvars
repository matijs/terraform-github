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
        ]
        strict_required_status_checks_policy = true
      }
    }
  },
  "probablerobot.net" = {
    rules = {
      required_signatures = true
      required_status_checks = {
        required_check = [
          { context = "deploy/netlify" },
          { context = "check" },
        ]
        strict_required_Status_checks_policy = true
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
        strict_required_status_checks_policy = true
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
