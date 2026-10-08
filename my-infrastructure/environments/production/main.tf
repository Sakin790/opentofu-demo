# 1. PostgreSQL Services Dynamic Deploy (4 Services)
module "postgres_services" {
  source   = "../../modules/postgres"
  for_each = var.pg_services

  service_name = each.key
  db_port      = each.value.port
  db_name      = each.value.db_name
  db_user      = each.value.db_user
  db_password  = each.value.password
}

# 2. MySQL Services Dynamic Deploy (4 Services)
module "mysql_services" {
  source   = "../../modules/mysql"
  for_each = var.mysql_services

  service_name  = each.key
  db_port       = each.value.port
  db_name       = each.value.db_name
  db_user       = each.value.db_user
  db_password   = each.value.password
  root_password = each.value.root_password
}

# 3. MinIO Services Dynamic Deploy (2 Services)
module "minio_services" {
  source   = "../../modules/minio"
  for_each = var.minio_services

  service_name = each.key
  api_port     = each.value.api_port
  console_port = each.value.console_port
  root_user    = each.value.root_user
  root_password = each.value.password
}