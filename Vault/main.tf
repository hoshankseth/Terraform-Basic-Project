provider "aws" {
    region = "us-east-1"
  
}

provider "vault" {
    address = "http://34.234.66.121:8200"
    skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = "d924f9d7-beb8-055a-6310-1670afe99479"
      secret_id = "020f6a19-a56e-0bc4-5b1f-c4d3303b86cc"
    }
  }
}

data "vault_kv_secret_v2" "example" {
  mount = "kv"
  name  = "test-secret"
}

resource "aws_instance" "ec2" {
    ami = "ami-053b0d53c279acc90"
    instance_type = "t2.micro"
    tags = {
      secret = data.vault_kv_secret_v2.example.data["baba"]
    }
  
}