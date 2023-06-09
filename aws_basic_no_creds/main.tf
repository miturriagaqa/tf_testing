terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.42"
    }
  }

  required_version = ">= 0.13.5"
}

provider "aws" {
  profile = "sales"
  region  = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-08d70e59c07c61a3a"
  instance_type = "t1.micro"

  tags = {
    Name = var.instance_name
  }
}

# Output hardcoded values
output "message" {
  value = "Hello, Terraform!"
}

output "number" {
  value = 42
}

output "list" {
  value = ["apple", "banana", "cherry"]
}

output "map" {
  value = {
    key1 = "value1"
    key2 = "value2"
  }
}
