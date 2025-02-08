branch_protections = [
  {
    name = "lab.probablerobot.net"
    contexts = [
      "deploy/netlify",
      "no-fixups",
    ]
  },
  {
    name = "dockerfiles"
    contexts = [
      "no-fixups",
    ]
  }
]
