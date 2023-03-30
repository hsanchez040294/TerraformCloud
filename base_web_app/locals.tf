resource "random_integer" "rand" {
  min = 10000
  max = 99999

}

locals {
  cidr_block_routes              = "0.0.0.0/0"
  protocol                       = "-1"
  from_port                      = 0
  to_port                        = 0
  s3_bucket_name                 = lower("TERRA-webapp-${random_integer.rand.result}")
  to_port_ssh                    = 22
  from_port_ssh                  = 22
  tcp_ssh                        = "tcp"
  name_prefix                    = "${var.nameprefix}-${terraform.workspace}"
  name_port_ingress_ngix         = "ngix_http"
  name_port_ingress_load_balance = "sg_load_balance"

  common_tags = {
    company      = "${var.company_name}-${terraform.workspace}"
    proyect      = "${var.project_name}-${terraform.workspace}"
    billing_code = "${var.billing_code}-${terraform.workspace}"
  }

}   