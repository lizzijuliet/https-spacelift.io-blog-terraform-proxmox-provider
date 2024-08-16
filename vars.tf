###########################################################################
#Configuracion del proveedor
variable "api_url" {
  default = "https://your-proxmox-host:8006/api2/json"
}
variable "token_id" {
  default = "api@pam!Api-Terraform"
}
variable "token_secret" {
  default = "xxxxxxxxxxxxxxxxx"
}

###########################################################################
#Configuracion de las VM
variable "proxmox_host" {
    default = "your host"
}
variable "ssh_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDm6WbrYYcCs75G5wrwmo5ybqAqx3Q2eD981k/3mpKSbxOaCIgHzkk9gxAdnz5UUm2N9syRrwOevGrNwZNpWx0J+3xAtDHuDzEfchfiCXFL8990Ao2cGx5J9JLLmC/ZPueZmxu4bGWOAp2xkvRBJkINmXowkZOKyIi5x/Ex5g9+jBnQlOeD/tBQUaFHsNwj3npmO1v73v0W0UMnpJvrtZ2ilxcvMrC+5O1mPyGv7J8jEAssL2pNSQk2T7NyHbmZtdOLMl9VxNNOAavXQedbrPZQV0wEqyuC4E7XDoktEwhE0gfSMOXsmqI3cRuwfPSGLsEkN3bvxVqVquomzX7nLB5R root@VM-SBM-CORE-ITS-TERRAFORM"
}
variable "vvmid" {
    type = number
    default = 200
}

variable "template_ubuntu" {
    default = "ubuntu200406-cloud"
}
variable "pools" {
    default = "I&T"
}
variable "stg" {
    default = "STG-xxx"
    }
variable "vmbr" {
    default = "vmbr3060"
}
variable "lan" {
    default = "192.168.68"
}
variable "masc" {
    default = "24"
}
variable "ip_gw" {
    default = "192.168.68.1"
}

variable "vmip" {
    default = 100
}

variable "name_id" {
    default = "K8s-MASTER"
}

variable "hagroup" {
    default = "K8s0"
}