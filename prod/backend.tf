terraform {
  backend "s3" {
    bucket = "terraform-state-kauanvarella-app-prod"
    key    = "terraform.tfstate"
    region = "us-west-2"
  }
}
