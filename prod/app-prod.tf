module "aws-prod" {
  source = "../infra"
  instancia = "t2.micro"
  regiao_aws = "us-west-2"
  chave = "ssh-prod-meuapp"
  gruposeguranca = "acesso_prod"
  tagname = "app-prod"
  ami = "ami-0d70546e43a941d70"
  pub_ip = "eipalloc-043143858d9147b05"
}

provider "aws" {
  region  = "us-west-2"
}