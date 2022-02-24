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
      instance_size_slug = "basic-xxs"
    }

    github {
      repo = "br7552/hello"
    }
  }
}
