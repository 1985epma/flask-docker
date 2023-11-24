terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image     = docker_image.nginx.image_id
  name      = "tutorial"
  user      = "1000:1000" // Substitua com o ID de usuário e grupo apropriado
  privileged = false      // Desativa privilégios escalados

  ports {
    internal = 80
    external = 8000
  }
}
