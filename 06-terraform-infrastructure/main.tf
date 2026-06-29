terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    ec2 = "http://localhost:4566"
    s3  = "http://localhost:4566"
  }
}

resource "aws_instance" "flask_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name        = "flask-app-server"
    Environment = "dev"
    Project     = "devops-learning-journey"
  }
}

resource "aws_s3_bucket" "app_bucket" {
  bucket = "devops-learning-journey-bucket"

  tags = {
    Name        = "app-storage"
    Environment = "dev"
  }
}
