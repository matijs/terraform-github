module "matijs-github-io" {
  source = "./modules/repository"

  name = "matijs.github.io"

  default_branch = "master"

  pages = {
    build_type = "legacy"
    source = {
      path = "/"
    }
  }
}

