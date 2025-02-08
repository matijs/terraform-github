variable "branch_protections" {
  type = list(object({
    name                            = string
    enforce_admins                  = optional(bool, true)
    allows_deletions                = optional(bool, false)
    allows_force_pushes             = optional(bool, false)
    required_linear_history         = optional(bool, true)
    strict                          = optional(bool, true)
    contexts                        = optional(list(string), [])
    required_approving_review_count = optional(number, 0)
    require_last_push_approval      = optional(bool, false)
  }))
}

resource "github_repository" "repository" {
  for_each = var.repositories

  name                        = each.key
  description                 = each.value.description != null ? "${each.value.description} (managed by Terraform)" : "managed by Terraform"
  homepage_url                = each.value.homepage_url
  auto_init                   = true
  allow_auto_merge            = (each.value.visibility == "private" ? false : each.value.allow_auto_merge)
  allow_merge_commit          = each.value.allow_merge_commit
  allow_rebase_merge          = each.value.allow_rebase_merge
  allow_squash_merge          = each.value.allow_squash_merge
  allow_update_branch         = each.value.allow_update_branch
  delete_branch_on_merge      = each.value.delete_branch_on_merge
  has_discussions             = each.value.has_discussions
  has_downloads               = each.value.has_downloads
  has_issues                  = each.value.has_issues
  has_projects                = each.value.has_projects
  has_wiki                    = each.value.has_wiki
  is_template                 = each.value.is_template
  topics                      = each.value.topics
  visibility                  = each.value.visibility
  vulnerability_alerts        = each.value.vulnerability_alerts
  web_commit_signoff_required = each.value.web_commit_signoff_required

  security_and_analysis {
    secret_scanning {
      status = each.value.secret_scanning
    }
    secret_scanning_push_protection {
      status = each.value.secret_scanning_push_protection
    }
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "github_branch_protection" "b" {
  for_each = { for p in var.branch_protections : p.name => p }

  repository_id           = github_repository.repository[each.value.name].node_id
  pattern                 = github_repository.repository[each.value.name].default_branch
  enforce_admins          = each.value.enforce_admins
  allows_deletions        = each.value.allows_deletions
  allows_force_pushes     = each.value.allows_force_pushes
  required_linear_history = each.value.required_linear_history

  required_status_checks {
    # this is only honoured if there is a GitHub status check (a context)
    strict   = each.value.strict
    contexts = each.value.contexts
  }

  required_pull_request_reviews {
    required_approving_review_count = each.value.required_approving_review_count
    require_last_push_approval      = each.value.require_last_push_approval
  }
}

resource "github_branch" "main" {
  for_each = github_repository.repository

  repository = each.value.name
  branch     = "main"
}

resource "github_branch_default" "main" {
  for_each = github_branch.main

  repository = each.value.repository
  branch     = each.value.branch
}
