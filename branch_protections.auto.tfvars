branch_protections = [
  {
    name     = "github-terraform"
    contexts = []
  },
  {
    name     = "lab.probablerobot.net"
    contexts = ["deploy/netlify"]
  }
]
