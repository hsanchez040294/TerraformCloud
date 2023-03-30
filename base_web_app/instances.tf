data "aws_ssm_parameter" "ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

# INSTANCES #
resource "aws_instance" "nginxs" {
  count                  = var.instaces_count[terraform.workspace]
  ami                    = nonsensitive(data.aws_ssm_parameter.ami.value)
  instance_type          = var.instance_type[terraform.workspace]
  subnet_id              = module.vpc.public_subnets[(count.index % var.vpc_subnet_count[terraform.workspace])]
  iam_instance_profile   = module.aws_s3.instance_profile.name
  vpc_security_group_ids = [aws_security_group.nginx-sg.id]
  #Dependencia
  depends_on = [
    module.aws_s3
  ]

  tags = merge(local.common_tags, {
    Name = "${var.nameinstances}-${local.name_prefix}-${count.index}"
  })
  #Configuraciones posteriores al despliegue
  #Resources
  #Passdata
  #Config Manager (Ansible)
  #Proviser 

  user_data = templatefile("${path.module}/startup_script.tpl", {
    #s3_bucket_name = aws_s3_bucket.web_bucket.id
    s3_bucket_name = module.aws_s3.web_bucket.id
  })
}