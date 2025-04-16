module "notepad" {
  source = "./modules/repository"

  name         = "notepad"
  description  = "Source code for https://matijs.github.io/notepad"
  homepage_url = "https://matijs.github.io/notepad"

  pages = {
    build_type = "legacy"
    source = {
      path = "/"
    }
  }
}

