terraform {
  required_version = ">= 1.0.0"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {}

resource "digitalocean_app" "hello" {
  spec {
    name   = "hello"
    region = "nyc1"

    service {
      name               = "hello-service"
      instance_size_slug = "basic-xxs"
      dockerfile_path    = "/Dockerfile"

      git {
        branch         = "master"
        repo_clone_url = "https://github.com/br7552/hello"
      }
    }
  }
}
