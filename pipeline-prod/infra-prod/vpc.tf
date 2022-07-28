resource "aws_default_vpc" "recurso_vpc" {
  
}

resource "aws_default_subnet" "recurso_subnet_1" {
  availability_zone = "${var.regiao_aws}a"
}

resource "aws_default_subnet" "recurso_subnet_2" {
  availability_zone = "${var.regiao_aws}b"
}