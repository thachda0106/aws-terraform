provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "hello" {
  ami           = "ami-0995922d49dc9a17d"
  instance_type = "t2.micro"
  tags = {
    Name = "HelloWorld"
  }
}
