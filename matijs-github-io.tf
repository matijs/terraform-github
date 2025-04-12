module "matijs-github-io" {
  source = "./modules/repository"

  name = "matijs.github.io"

  pages = {
    build_type = "legacy"
    source = {
      path = "/"
    }
  }
}

