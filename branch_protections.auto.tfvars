branch_protections = [
  {
    name     = "github-terraform"
    contexts = ["terraform plan"]
  },
  {
    name     = "lab.probablerobot.net"
    contexts = ["deploy/netlify"]
  }
]
