resource "github_repository_ruleset" "ruleset" {
  for_each = var.rulesets

  enforcement = each.value.enforcement
  name        = each.value.name
  repository  = each.key
  target      = "branch"

  conditions {
    ref_name {
      include = ["~DEFAULT_BRANCH"]
      exclude = []
    }
  }

  rules {
    deletion                = each.value.rules.deletion
    non_fast_forward        = each.value.rules.non_fast_forward
    required_linear_history = each.value.rules.required_linear_history
    required_signatures     = each.value.rules.required_signatures

    pull_request {
      dismiss_stale_reviews_on_push     = each.value.rules.pull_request.dismiss_stale_reviews_on_push
      require_code_owner_review         = each.value.rules.pull_request.require_code_owner_review
      require_last_push_approval        = each.value.rules.pull_request.require_last_push_approval
      required_approving_review_count   = each.value.rules.pull_request.required_approving_review_count
      required_review_thread_resolution = each.value.rules.pull_request.required_review_thread_resolution
    }

    dynamic "required_status_checks" {
      for_each = each.value.rules.required_status_checks != null ? [each.value.rules.required_status_checks] : []

      content {
        strict_required_status_checks_policy = required_status_checks.value.strict_required_status_checks_policy

        dynamic "required_check" {
          for_each = required_status_checks.value.required_check

          content {
            context = required_check.value.context
          }
        }
      }
    }
  }
}


