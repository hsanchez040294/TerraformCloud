variable "aws_region" {
  description = "Region para desplegar Oregon"
  default     = "us-west-2"
  type        = string
}

variable "network_cids" {
  description = "red interna"
  type        = list(string)
  default     = ["10.0.0.0/24", "10.0.1.0/24"]
}


variable "network_cid_vpc" {
  description = "red vpc"
  type        = map(string)
  //default     = "10.0.0.0/16"
}

variable "security_tcp" {
  description = "grupo de seguridad"
  type        = string
  default     = "80"
}

variable "cidr_blocks" {
  type    = string
  default = "0.0.0.0/0"
}

variable "sg_protocol" {
  type    = string
  default = "tcp"
}

variable "sg_name_alb_sg" {
  default = "nginx_alb_sg"
  type    = string
}

variable "sg_name" {
  default = "nginx_sg"
  type    = string
}

variable "instance_type" {
  type    = map(string)
 // default = "t2.micro"
}

variable "instance_ami" {
  type    = string
  default = "ami-0b029b1931b347543"
}

variable "company_name" {
  type    = string
  default = "Sistemas CASA"
}

variable "project_name" {
  type    = string
  default = "Bodega Americana"

}

variable "environment_name" {
  type    = string
  default = "Desarrollo"

}

variable "project" {
  type        = string
  description = "Project name for resource tagging"
  default     = "Bodega Americana"
}

variable "billing_code" {
  type        = string
  description = "Billing code for resource tagging"
  default     = "Enero"
}

variable "puerto_servidor" {
  description = "Puerto para la instancia EC2"
  type        = number
  default = 80

  validation {
    condition     = var.puerto_servidor > 0 && var.puerto_servidor <= 65536
    error_message = "El valor del puerto debe de estar comprendido entre 1 y 65336."
  }
}

variable "vpc_subnet_count" {
  type        = map(number)
  description = "Count of subnets"
  //default     = 2
}

variable "instaces_count" {
  type        = map(number)
  description = "Count of instances"

}

variable "nameprefix" {
  type        = string
  description = "value"
  default     = "MiAppTerra"
}

variable "nameinstances" {
  type        = string
  description = "Instancias de nginxs"
  default     = "ngixns-load-balance "
}

variable "namebalancer" {
  type        = string
  description = "Nombre de la instancia"
  default     = "web-alb"

}

variable "vpcnamebalancer" {
  type        = string
  description = "Nombre de la VPC"
  default     = "vpc-load-balance"
}

variable "routenamebalancer" {
  type        = string
  description = "Nombre del route"
  default     = "route-load-balance"
}
variable "s3namebalancer" {
  type        = string
  description = "Nombre del s3"
  default     = "allow_s3_all"
}

variable "name_aws_iam_role" {
  type        = string
  description = "Nombre del aws_iam_role"
  default     = "allow_nginx_s3"
}
variable "name_aws_iam_instance_profile" {
  type        = string
  description = "Nombre del perfil instancia"
  default     = "nginx_profile_jls"
}
