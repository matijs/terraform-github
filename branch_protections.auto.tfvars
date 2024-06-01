branch_protections = [
  {
    name = "github-terraform"
    contexts = [
      "Terraform format check",
      "Terraform Cloud/matijs/repo-id-xTdtApDiyNBVUu6g",
      "no-fixups",
    ]
  },
  {
    name = "lab.probablerobot.net"
    contexts = [
      "deploy/netlify",
      "no-fixups",
    ]
  },
  {
    name = "dockerfiles"
    context = [
      "no-fixups",
    ]
  }
]
