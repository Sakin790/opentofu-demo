# modules/postgres/variables.tf
variable "service_name" { type = string }
variable "db_port" { type = number }
variable "db_name" { type = string }
variable "db_user" { type = string }



variable "db_password" {
  type      = string
  sensitive = true
}
