module "matijs-github-io" {
  source = "./modules/repository"

  name         = "matijs.github.io"
  description  = "Source code for https://matijs.github.io"
  homepage_url = "https://matijs.github.io"

  pages = {
    build_type = "legacy"
    source = {
      path = "/"
    }
  }
}

