resource "aws_launch_template" "recurso-teste-asg" {
  image_id = "ami-019623b03aa9dbe92"
  instance_type = var.instancia
  user_data = filebase64("start.sh")
  security_group_names = [aws_security_group.acesso_projeto.name]
  tags = {
      Name = "teste-asg-template"
  }
}

resource "aws_autoscaling_group" "recurso_grupoasg" {
  name = "nome-asggrupo-teste"
  availability_zones = ["${var.regiao_aws}a", "${var.regiao_aws}b"]
  desired_capacity = var.desejado
  max_size = var.maximo
  min_size = var.minimo

  launch_template {
    id = aws_launch_template.recurso-teste-asg.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.recurso_alvo_alb.arn]
}

resource "aws_autoscaling_policy" "recurso_asg_politica" {
  name = "nome_teste_asg_politica"
  autoscaling_group_name = aws_autoscaling_group.recurso_grupoasg.name
  policy_type = "TargetTrackingScaling"
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0
  }
}