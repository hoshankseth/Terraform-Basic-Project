terraform {
  backend "s3" {
    bucket = "baba-s3-demo-xyz"
    region = "us-east-1"
    key = "baba/terraform.tfstate"
    #dynamodb_table = "tf_lock"
  }
}