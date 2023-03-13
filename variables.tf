variable "location" {
  type    = string
  default = "canadaeast"
}


variable "vm_count" {
  type = number
  default = 2
}

variable "vm_size" {
  type = string
  default = "Standard_DS1_v2"
}

variable "admin_username" {
  type = string
  default = "adminuser"
}

variable "admin_password" {
  type = string
  default = "Vinit1234@"
}