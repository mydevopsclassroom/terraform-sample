variable "env" {
    type = string
    default = "prod"
}

variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "private_subnet_cidr" {
  type = string
  default = "10.0.1.0/24"
}

variable "public_subnet_cidr" {
  type = string
  default = "10.0.2.0/24"
}


#modules, locals, workspace, 

#output, for_each, data source , 

