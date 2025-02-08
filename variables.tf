variable "GITHUB_TOKEN" {
  description = "GitHub personal access token"
  type        = string
  sensitive   = true
}

variable "repos" {
  type = map(object({
    description                     = optional(string)
    homepage_url                    = optional(string)
    allow_auto_merge                = optional(bool, true)
    allow_merge_commit              = optional(bool, false)
    allow_rebase_merge              = optional(bool, true)
    allow_squash_merge              = optional(bool, true)
    allow_update_branch             = optional(bool, true)
    delete_branch_on_merge          = optional(bool, true)
    has_discussions                 = optional(bool, false)
    has_downloads                   = optional(bool, false)
    has_issues                      = optional(bool, true)
    has_projects                    = optional(bool, false)
    has_wiki                        = optional(bool, false)
    is_template                     = optional(bool, false)
    secret_scanning                 = optional(string, "enabled")
    secret_scanning_push_protection = optional(string, "enabled")
    topics                          = optional(list(string), [])
    visibility                      = optional(string, "public")
    vulnerability_alerts            = optional(bool, true)
    web_commit_signoff_required     = optional(bool, false)
  }))
}

variable "branch_rulesets" {
  type = map(object({
    name                            = optional(string, "main-branch-protection")
    enforcement                     = optional(string, "disabled")
    required_signatures             = optional(bool, false)
    required_linear_history         = optional(bool, true)
    required_approving_review_count = optional(number, 0)
    require_last_push_approval      = optional(bool, false)
  }))
}
