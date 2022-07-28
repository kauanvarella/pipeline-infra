terraform {
  backend "s3" {
    bucket = "terraform-state-kauanvarella-app-homolog"
    key    = "terraform.tfstate"
    region = "us-west-2"
  }
}
