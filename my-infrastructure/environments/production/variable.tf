variable "vm_ip" { type = string }
variable "ssh_user" { type = string }

variable "pg_services" {
  type = map(object({
    port     = number
    db_name  = string
    db_user  = string
    password = string
  }))
}

variable "mysql_services" {
  type = map(object({
    port          = number
    db_name       = string
    db_user       = string
    password      = string
    root_password = string
  }))
}

variable "minio_services" {
  type = map(object({
    api_port     = number
    console_port = number
    root_user    = string
    password     = string
  }))
}