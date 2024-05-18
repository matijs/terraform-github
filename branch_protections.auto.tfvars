branch_protections = [
  {
    name     = "github-terraform"
    contexts = ["Terraform format check", "Terraform Cloud/matijs/repo-id-53xmSoN1VjKDqvh4"]
  },
  {
    name     = "lab.probablerobot.net"
    contexts = ["deploy/netlify"]
  }
]
