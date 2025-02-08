resource "github_repository_ruleset" "ruleset" {
  for_each = var.rulesets

  enforcement = each.value.enforcement
  name        = each.value.name
  repository  = each.key
  target      = "branch"

  conditions {
    ref_name {
      include = ["refs/heads/main"]
      exclude = []
    }
  }

  rules {
    pull_request {
      required_approving_review_count = each.value.required_approving_review_count
      require_last_push_approval      = each.value.require_last_push_approval
    }
    required_linear_history = each.value.required_linear_history
    required_signatures     = each.value.required_signatures
  }
}


