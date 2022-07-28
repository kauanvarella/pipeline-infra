resource "aws_lb" "recurso_lb" {
  name = "Prod-LoadBalancer"
  internal = false
  load_balancer_type = "application"
  subnets = [aws_default_subnet.recurso_subnet_1.id, aws_default_subnet.recurso_subnet_2.id]
}

resource "aws_lb_target_group" "recurso_alvo_alb" {
  name = "Prod-AlvoLoadBalancer"
  port = "80"
  protocol = "HTTP"
  vpc_id = aws_default_vpc.recurso_vpc.id
}

resource "aws_lb_listener" "recurso_ouvinte_alb" {
  load_balancer_arn = aws_lb.recurso_lb.arn
  port = "80"
  protocol = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.recurso_alvo_alb.arn
  }
}