# modules/mysql/main.tf
resource "docker_image" "mysql" {
  name         = "mysql:8.0"
  keep_locally = true
}

resource "docker_volume" "mysql_data" {
  name = "${var.service_name}_data"
}

resource "docker_container" "mysql" {
  name  = var.service_name
  image = docker_image.mysql.image_id

  ports {
    internal = 3306
    external = var.db_port
  }

  env = [
    "MYSQL_DATABASE=${var.db_name}",
    "MYSQL_USER=${var.db_user}",
    "MYSQL_PASSWORD=${var.db_password}",
    "MYSQL_ROOT_PASSWORD=${var.root_password}"
  ]

  mounts {
    target = "/var/lib/mysql"
    source = docker_volume.mysql_data.name
    type   = "volume"
  }

  restart = "unless-stopped"
}