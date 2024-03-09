#Load Balancer
#App Load Balancer

resource "aws_lb" "TRN_App_lb" {
  name               = "trn-applb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.applb_sg.id]
  #subnets            = [aws_subnet.my_public-subnet1.id, aws_subnet.my_public-subnet2.id]

  subnet_mapping {
    subnet_id            = aws_subnet.my_public-subnet1.id
  }
  subnet_mapping {
    subnet_id            = aws_subnet.my_public-subnet2.id
  }


  enable_deletion_protection = true

  access_logs {
    bucket  = aws_s3_bucket.trn_app_accesslogs.id
    prefix  = "trnapp-lb"
    enabled = false
  }

  tags = { 
    Environment = "Training Environment"
  }
}

#Target group

resource "aws_lb_target_group" "tg_1" {
  name     = "trn-app-tg1"
  port     = 443
  protocol = "HTTPS"
  vpc_id   = aws_vpc.my_vpc.id
}


resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.TRN_App_lb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_1.arn
  }
}

#Target group 2

resource "aws_lb_target_group" "tg_2" {
  name     = "trn-app-tg2"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.my_vpc.id
}

resource "aws_lb_listener" "re-direct" {
  load_balancer_arn = aws_lb.TRN_App_lb.arn
  port              = "80"
  protocol          = "HTTP"

default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

########Target Group Attachement - EC2 Instances

resource "aws_lb_target_group_attachment""my_tg_attachment1" {
  target_group_arn = aws_lb_target_group.tg_2.arn
  target_id        = aws_instance.My-ec2-instance1.id
  port             = 80
}

resource "aws_lb_target_group_attachment""my_tg_attachment2" {
  target_group_arn = aws_lb_target_group.tg_1.arn
  target_id        = aws_instance.My-ec2-instance2.id
  port             = 443
}