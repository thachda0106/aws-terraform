resource "aws_instance" "web" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"
  tags = {
    Name = "MyWebServer"
  }

  lifecycle {
    prevent_destroy       = true
    create_before_destroy = true
    ignore_changes        = [tags]
  }
}
