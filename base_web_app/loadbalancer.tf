resource "aws_lb" "nginx" {
  name               = "${var.namebalancer}-${local.name_prefix}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb-sg.id]
  subnets            = module.vpc.public_subnets

  enable_deletion_protection = false

  access_logs {
    bucket  = module.aws_s3.web_bucket.bucket
    prefix  = "alb-logs"
    enabled = true
  }

  tags = merge(local.common_tags, {
    Name = "${var.namebalancer}-${local.name_prefix}"
  })
}

data "aws_elb_service_account" "root" {

}

resource "aws_lb_target_group" "nginx" {
  //name     = "nginx-alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id

  tags = merge(local.common_tags, {
    Name = "nginx-alb-tg-${local.name_prefix}"
  })
}

resource "aws_lb_listener" "nginx" {
  load_balancer_arn = aws_lb.nginx.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nginx.arn
  }

  tags = merge(local.common_tags, {
    Name = "aws_lb_listener-${local.name_prefix}"
  })
}

resource "aws_lb_target_group_attachment" "nginxs" {
  count            = var.instaces_count[terraform.workspace]
  target_group_arn = aws_lb_target_group.nginx.arn
  target_id        = aws_instance.nginxs[count.index].id
  port             = 80
}