terraform {
  backend "s3" {
    bucket = "mahaterraform"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
