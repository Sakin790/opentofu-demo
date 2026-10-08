



variable "service_name" { type = string }
variable "api_port" { type = number }
variable "console_port" { type = number }
variable "root_user" { type = string }


variable "root_password" {
  type = string
  sensitive = true
}
