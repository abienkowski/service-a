terraform {
  backend s3 {
    bucket = "nginx-service-terraform"
    key = "terraform.tfstate"
    region = "us-east-2"
  }
}
