# SECURITY GROUPS #
# Nginx security group 
resource "aws_security_group" "nginx-sg" {
  name   = var.sg_name
  vpc_id = module.vpc.vpc_id
  # HTTP access from anywhere
  ingress {
    from_port   = var.security_tcp
    to_port     = var.security_tcp
    protocol    = var.sg_protocol
    cidr_blocks = [var.network_cid_vpc[terraform.workspace]]
  }

  tags = merge(local.common_tags, {
    Name = local.name_port_ingress_ngix
  })

  # outbound internet access
  egress {
    from_port   = local.from_port
    to_port     = local.to_port
    protocol    = local.protocol
    cidr_blocks = [var.cidr_blocks]
  }

  #ACCESO POR SSH 
  ingress {
    from_port   = local.from_port_ssh
    to_port     = local.to_port_ssh
    protocol    = local.tcp_ssh
    cidr_blocks = [var.cidr_blocks]
  }
}

#BALANCELOAD
resource "aws_security_group" "alb-sg" {
  name   = var.sg_name_alb_sg
  vpc_id = module.vpc.vpc_id

  # HTTP access from anywhere
  ingress {
    from_port   = var.security_tcp
    to_port     = var.security_tcp
    protocol    = var.sg_protocol
    cidr_blocks = [var.cidr_blocks]
  }

  tags = merge(local.common_tags, {
    Name = local.name_port_ingress_load_balance
  })

  # outbound internet access
  egress {
    from_port   = local.from_port
    to_port     = local.to_port
    protocol    = local.protocol
    cidr_blocks = [var.cidr_blocks]
  }
}