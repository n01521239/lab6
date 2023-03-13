# modules/network/variables.tf

variable "location" {
  type    = string
  default = "canadaeast"
}
variable "networking_rg" {
  description = "Name of the resource group for networking resources."
	default = "my-networking-rg"
}

variable "networking_rg_name" {
  type    = string
  default = "networking-rg"
}

variable "address_space" {
  description = "The address space used by the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}


variable "vnet_name" {
  type    = string
  default = "my-vnet"
}

variable "subnet1_name" {
  type    = string
  default = "subnet1"
}


variable "subnet1_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "subnet2_name" {
  type    = string
  default = "subnet2"
}

variable "subnet2_cidr" {
  type    = string
  default = "10.0.2.0/24"
}

variable "nsg1_name" {
  type    = string
  default = "nsg1"
}

variable "nsg2_name" {
  type    = string
  default = "nsg2"
}

variable "allow_ssh_from_ip" {
  type    = string
  default = "0.0.0.0/0"
}

variable "allow_rdp_from_ip" {
  type    = string
  default = "0.0.0.0/0"
}
