variable "repos" {
  type = list(object({
    name                        = string
    description                 = optional(string)
    homepage_url                = optional(string)
    allow_auto_merge            = optional(bool, true)
    allow_merge_commit          = optional(bool, false)
    allow_rebase_merge          = optional(bool, true)
    allow_squash_merge          = optional(bool, true)
    allow_update_branch         = optional(bool, true)
    delete_branch_on_merge      = optional(bool, true)
    has_discussions             = optional(bool, false)
    has_downloads               = optional(bool, false)
    has_issues                  = optional(bool, true)
    has_projects                = optional(bool, false)
    has_wiki                    = optional(bool, false)
    is_template                 = optional(bool, false)
    visibility                  = optional(string, "public")
    vulnerability_alerts        = optional(bool, true)
    web_commit_signoff_required = optional(bool, false)
  }))
}

resource "github_repository" "all" {
  for_each = {
    for repo in var.repos :
    repo.name => repo
  }

  name                        = each.value.name
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
  visibility                  = each.value.visibility
  vulnerability_alerts        = each.value.vulnerability_alerts
  web_commit_signoff_required = each.value.web_commit_signoff_required

  lifecycle {
    prevent_destroy = true
  }
}

resource "github_branch_protection" "all" {
  for_each = github_repository.all

  repository_id           = each.value.node_id
  pattern                 = each.value.default_branch
  enforce_admins          = true
  required_linear_history = true
  required_status_checks {
    strict = true
  }
  required_pull_request_reviews {
    required_approving_review_count = 0
    require_last_push_approval      = false
  }
}

resource "github_branch" "main" {
  for_each = github_repository.all

  repository = each.value.name
  branch     = "main"
}
