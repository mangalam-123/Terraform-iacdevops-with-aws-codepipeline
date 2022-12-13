
# resource "aws_lb" "my-alb" {
#   name = "my-application-alb"
#   internal = false
#   load_balancer_type = "application"
#   security_groups = [aws_security_group.alb-sg.id]
#   subnets = [ for subnet in aws_subnet.pub_subnet: subnet.id ]
#   enable_deletion_protection = false

#   tags = {
#     "Name" = "Edf_alb"
#   }
# }

# resource "aws_lb_target_group" "Edf_tg" {
#   protocol = "HTTP"
#   port = 80
#   vpc_id = aws_vpc.Edf_vpc.id

#   stickiness {
#     enabled = true
#     type = "lb_cookie"
#   }

#   health_check {
#     healthy_threshold = 2
#     protocol = "HTTP"
#     interval = 30
#     unhealthy_threshold = 2
#   }

#   tags = {
#     "Name": "Edf_alb_tg"
#   }
# }

# resource "aws_lb_listener" "Edf_lb" {
#    protocol = "HTTP"
#    port = 80
#    load_balancer_arn = aws_lb.my-alb.arn
#    default_action {
#      type = "forward"
#      target_group_arn = aws_lb_target_group.Edf_tg.id
#    }
# }

# resource "aws_lb_target_group_attachment" "Edf_attchement" {
#   target_group_arn = aws_lb_target_group.Edf_tg.id
#   target_id = aws_instance.Edf_ec2.id
#   port = 80
# }


resource "aws_lb" "Edf-alb" {
  
  name = "EDF-alb"
  internal = false
  load_balancer_type = "application"
  security_groups = [ aws_security_group.alb-sg.id ]
  subnets = [ for subnet in aws_subnet.pub_subnet: subnet.id ]
  enable_deletion_protection = false

  tags={
    "Name": "Edf-alb"
  }
}

resource "aws_lb_target_group" "EDF-tg" {
  protocol = "HTTP"
  port = 80
  vpc_id = aws_vpc.Edf_vpc.id

  stickiness {
    enabled = true
    type = "lb_cookie"
  }

  health_check {
    healthy_threshold = 2
    interval = 30
    protocol = "HTTP"
    unhealthy_threshold = 2
  }

  tags = {
    "Name" = "Edf-tg"
  }
}

resource "aws_lb_listener" "newlisterner" {
  protocol = "HTTP"
  port = 80
  load_balancer_arn = aws_lb.Edf-alb.arn

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.EDF-tg.arn
  }
}

resource "aws_lb_target_group_attachment" "myedf" {
  count = 2
  target_group_arn = aws_lb_target_group.EDF-tg.arn
  target_id = element(aws_instance.Edf_ec2.*.id, count.index)
  port = 80
}