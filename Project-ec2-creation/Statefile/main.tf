provider "aws" {
    region = "us-east-1"  
}

resource "aws_instance" "baba" {
    instance_type = "t2.micro"
    ami = "ami-0759f51a90924c166"
    subnet_id = "subnet-0c2fbbffc46acaafd"
}

resource "aws_s3_bucket" "s3_bucket" {
    bucket = "baba-s3-demo-xyz"
}

resource "aws_dynamodb_table" "tf_lock" {
    name = "terraform-lock"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"

    attribute {
      name = "LockID"
      type = "S"
    }
}