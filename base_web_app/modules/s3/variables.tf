variable "bucket_name" {
    type = string
    description = "Nombre del bucket de s3"
    #default = lower("TERRA-webapp-${random_integer.rand.result}")
  
}

variable "elb_service_account_arn" {
    type = string
    description = "Nombre del bucket de s3"
  
}

variable "common_tags" {
    type = map(string)
    default = {
    }
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