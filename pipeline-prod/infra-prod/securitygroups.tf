resource "aws_security_group" "acesso_projeto" {
  name = var.gruposeguranca
  description = var.gruposeguranca
  vpc_id = aws_default_vpc.recurso_vpc.id

  ingress{
      cidr_blocks = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      from_port = 0
      to_port = 0
      protocol = "-1"
  }
  egress{
      cidr_blocks = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      from_port = 0
      to_port = 0
      protocol = "-1"
  }
  tags = {
      Name = var.gruposeguranca
  }
}