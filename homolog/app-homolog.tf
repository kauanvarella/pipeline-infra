module "aws-homolog" {
  source = "../infra"
  instancia = "t2.micro"
  regiao_aws = "us-west-2"
  chave = "ssh-prod-meuapp"
  gruposeguranca = "acesso_homolog"
  tagname = "app-homolog"
  ami = "ami-0d70546e43a941d70"
  pub_ip = "eipalloc-073ccad585620e5d0"
}

provider "aws" {
  region  = "us-west-2"
}