variable "cidr" {
  type = string
   default = "10.0.0.0/16"
}

# variable "subnet_cidrs" {
#   type = list(string)
# }

variable "env" {
  type = string
  default = "prod"
}

variable "public_subnet_cidr" {
  type = string
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  type = string
  default = "10.0.2.0/24"
}


# Why we need modules? Reusablity

# DEV, STAGE, PROD 

