variable "name" {
  description = "(required) The name of the repository."
  type        = string
}

variable "allow_auto_merge" {
  description = "(optional) Set to `false` to disallow auto-merging of pull requests."
  type        = bool
  default     = true
}

variable "allow_merge_commit" {
  description = "(optional) Set to `true` to allow merge commits."
  type        = bool
  default     = false
}

variable "allow_rebase_merge" {
  description = "(optional) Set to `false` to disable rebase merges."
  default     = true
  type        = bool
}

variable "allow_squash_merge" {
  description = "(optional) Set to `true` to allow squash merges."
  type        = bool
  default     = true
}

variable "allow_update_branch" {
  description = "(optional) Set to `false` to disabled suggestions to update pull request branches in the GitHub UI."
  type        = bool
  default     = true
}

variable "archived" {
  description = "(optional) Set to `true` to archive the repository."
  type        = bool
  default     = false
}

variable "archive_on_destroy" {
  description = "(optional) Set to `true` to archive the repository instead of destroying it."
  type        = bool
  default     = false
}

variable "auto_init" {
  description = "(optional) Create an initial commit after creating the repository."
  type        = bool
  default     = true
}

variable "delete_branch_on_merge" {
  description = "(optional) Set to `false` to keep branches around after merging pull requests."
  type        = bool
  default     = true
}

variable "description" {
  description = "(optional) Description of the repository."
  default     = null
  type        = string
}

variable "has_discussions" {
  description = "(optional) Set to `true` to enable discussions on the repository."
  type        = bool
  default     = false
}

variable "has_issues" {
  description = "(optional) Set to `false` to disable issues on the repository."
  type        = bool
  default     = true
}

variable "has_projects" {
  description = "(optional) Set to `true` to enable GitHub Projects features on the repository."
  type        = bool
  default     = false
}

variable "has_wiki" {
  description = "(optional) Set to `true` to enable GitHub wiki features on the repository."
  type        = bool
  default     = false
}

variable "homepage_url" {
  description = "(optional) URL for the repository."
  type        = string
  default     = null
}

variable "topics" {
  description = "(optional) List of topics for the repository."
  type        = list(string)
  default     = []
}

variable "visibility" {
  description = "(optional) Defaults to `public`, set to `private` to make the repository private."
  type        = string
  default     = "public"
}

variable "vulnerability_alerts" {
  description = "(optional) Set to `false` to disable security alerts for vulnerable dependencies."
  type        = bool
  default     = true
}

variable "pages" {
  description = "(optional) Enable GitHub Pages for the repository."
  type = object({
    build_type = optional(string)
    cname = optional(string)

    source = object({
      branch = optional(string)
      path   = string
    })
  })
  default = null
}

# https://docs.github.com/en/get-started/learning-about-github/about-github-advanced-security
variable "advanced_security_status" {
  description = "(optional) For private repos only, set to `disabled` disable advanced security features on the repository."
  type        = string
  default     = "enabled"
}

variable "secret_scanning_status" {
  description = "(optional) Set to `disabled` to disable secret scanning for the repository."
  type        = string
  default     = "enabled"
}

variable "secret_scanning_push_protection_status" {
  description = "(optional) Set to `disabled` to disable secret scanning push protection for the repository."
  type        = string
  default     = "enabled"
}

variable "default_branch" {
  description = "(optional) The name of the default branch of the repository."
  type        = string
  default     = "main"
}

variable "dependabot_security_updates_enabled" {
  description = "(optional) Set to `false` to disable Dependabot security updates."
  type        = bool
  default     = true
}

variable "required_approving_review_count" {
  description = "(optional) The number of approving reviews needed to merge a pull request."
  type        = number
  default     = 0
}

variable "required_checks" {
  description = "(optional) A list of required status checks."
  type = list(object({
    context        = string
    integration_id = optional(string)
  }))
  default = []
}
