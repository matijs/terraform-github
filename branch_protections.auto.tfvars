branch_protections = [
  {
    name = "github-terraform"
  },
  {
    name     = "lab.probablerobot.net"
    contexts = ["deploy/netlify"]
  }
]
