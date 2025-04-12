resource "github_repository" "this" {
  name = var.name

  allow_auto_merge       = var.allow_auto_merge
  allow_update_branch    = var.allow_update_branch
  allow_merge_commit     = var.allow_merge_commit
  allow_rebase_merge     = var.allow_rebase_merge
  allow_squash_merge     = var.allow_squash_merge
  archived               = var.archived
  archive_on_destroy     = var.archive_on_destroy
  auto_init              = var.auto_init
  delete_branch_on_merge = var.delete_branch_on_merge
  description            = var.description
  has_discussions        = var.has_discussions
  has_downloads          = false # deprecated
  has_issues             = var.has_issues
  has_projects           = var.has_projects
  has_wiki               = var.has_wiki
  homepage_url           = var.homepage_url
  topics                 = var.topics
  visibility             = var.visibility
  vulnerability_alerts   = var.vulnerability_alerts

  dynamic "pages" {
    for_each = var.pages != null ? [var.pages] : []

    content {
      build_type = lookup(pages.value, "build_type", "workflow")
      cname      = pages.value.cname

      source {
        branch = coalesce(pages.value.source.branch, var.default_branch)
        path   = pages.value.source.path
      }
    }
  }

  security_and_analysis {
    dynamic "advanced_security" {
      # For repositories with public visibility, advanced security is always enabled and cannot be changed so this setting cannot be applied.
      for_each = var.visibility == "public" ? [] : [1]

      content {
        status = var.advanced_security_status
      }
    }

    secret_scanning {
      status = var.secret_scanning_status
    }

    secret_scanning_push_protection {
      status = var.secret_scanning_push_protection_status
    }
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "github_branch" "this" {
  repository = github_repository.this.name

  branch = var.default_branch
}

resource "github_branch_default" "this" {
  repository = github_repository.this.name

  branch = github_branch.this.branch
}

resource "github_repository_dependabot_security_updates" "this" {
  repository = github_repository.this.name

  enabled = var.dependabot_security_updates_enabled
}

resource "github_repository_ruleset" "default" {
  repository = github_repository.this.name

  enforcement = "active"
  name        = "default-branch-protection"
  target      = "branch"

  conditions {
    ref_name {
      include = ["~DEFAULT_BRANCH"]
      exclude = []
    }
  }

  rules {
    creation                      = false
    deletion                      = true
    non_fast_forward              = true
    required_linear_history       = true
    required_signatures           = true
    update                        = false
    update_allows_fetch_and_merge = false

    pull_request {
      dismiss_stale_reviews_on_push     = false
      require_code_owner_review         = true
      require_last_push_approval        = false
      required_approving_review_count   = var.required_approving_review_count
      required_review_thread_resolution = false
    }

    dynamic "required_status_checks" {
      for_each = length(var.required_checks) > 0 ? [1] : []

      content {
        dynamic "required_check" {
          for_each = var.required_checks

          content {
            context        = required_check.value.context
            integration_id = required_check.value.integration_id
          }
        }
        strict_required_status_checks_policy = true
      }
    }
  }
}
