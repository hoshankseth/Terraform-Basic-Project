provider "aws" {
    region = "us-east-1"  
}

resource "aws_instance" "abc" {
    ami = "ami-018ba43095ff50d08"
    instance_type = "t2_micro"
}