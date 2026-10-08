# modules/postgres/main.tf
resource "docker_image" "postgres" {
  name         = "postgres:16-alpine"
  keep_locally = true
}

resource "docker_volume" "pg_data" {
  name = "${var.service_name}_data"
}

resource "docker_container" "postgres" {
  name  = var.service_name
  image = docker_image.postgres.image_id

  ports {
    internal = 5432
    external = var.db_port
  }

  env = [
    "POSTGRES_DB=${var.db_name}",
    "POSTGRES_USER=${var.db_user}",
    "POSTGRES_PASSWORD=${var.db_password}"
  ]

  mounts {
    target = "/var/lib/postgresql/data"
    source = docker_volume.pg_data.name
    type   = "volume"
  }

  restart = "unless-stopped"
}