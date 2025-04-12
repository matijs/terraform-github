module "matijs-github-io" {
  source = "./modules/repository"

  name = "matijs.github.com"

  default_branch = "master"

  pages = {
    build_type = "legacy"
    source = {
      path = "/"
    }
  }
}

