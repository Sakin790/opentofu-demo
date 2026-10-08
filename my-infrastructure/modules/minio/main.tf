# modules/minio/main.tf
resource "docker_image" "minio" {
  name         = "minio/minio:latest"
  keep_locally = true
}

resource "docker_volume" "minio_data" {
  name = "${var.service_name}_data"
}

resource "docker_container" "minio" {
  name  = var.service_name
  image = docker_image.minio.image_id

  ports {
    internal = 9000
    external = var.api_port
  }

  ports {
    internal = 9001
    external = var.console_port
  }

  env = [
    "MINIO_ROOT_USER=${var.root_user}",
    "MINIO_ROOT_PASSWORD=${var.root_password}"
  ]

  command = ["server", "/data", "--console-address", ":9001"]

  mounts {
    target = "/data"
    source = docker_volume.minio_data.name
    type   = "volume"
  }

  restart = "unless-stopped"
}