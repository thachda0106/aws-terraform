provider "aws" {
  region  = "us-east-1"

  default_tags {
    tags = var.DEFAULT_TAG
  }
}

resource "aws_instance" "web" {
  ami           = "ami-123456"
  instance_type = "t2.micro"

  tags = {
    Name = "web-server"
  }
}
