resource "docker_image" "nexvion" {
  name = var.image_name

  build {
    context    = ".."
    dockerfile = "docker/Dockerfile"
  }
}

resource "docker_container" "nexvion" {
  name  = var.container_name
  image = docker_image.nexvion.image_id

  ports {
    internal = 80
    external = var.host_port
  }
}