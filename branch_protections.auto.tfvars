branch_protections = [
  {
    name     = "github-terraform"
    contexts = ["Terraform format check", "Terraform Cloud/matijs/repo-id-xTdtApDiyNBVUu6g"]
  },
  {
    name     = "lab.probablerobot.net"
    contexts = ["deploy/netlify"]
  }
]
