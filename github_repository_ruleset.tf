resource "github_repository_ruleset" "require-linear-history" {
  enforcement = "active"
  name        = "require-linear-history"
  target      = "branch"

  rules {
    required_linear_history = true
  }
}
