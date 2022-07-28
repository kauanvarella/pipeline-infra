module "aws-prod" {
  source = "../infra-prod"
  instancia = "t2.micro"
  regiao_aws = "us-west-2"
  chave = "ssh-prod-meuapp"
  gruposeguranca = "acesso_prod"
  maximo = 3
  minimo = 1
  desejado = 1
}