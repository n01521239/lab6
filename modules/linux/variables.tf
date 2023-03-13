variable "location" {
  type = string
  default = "canadaeast"
}

variable "vm_count" {
  type = number
  default = 2
}

variable "vm_name_prefix" {
  type = string
  default = "vm"
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
  default = "password"
}

variable "availability_set_name" {
  type = string
  default = "availset"
}

variable "linux_rg_name" {
  type = string
  default = "linux-rg"
}

variable "subnet_id" {
  description = "ID of the subnet to attach the network interface to"
}
