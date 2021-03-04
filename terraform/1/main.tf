provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami = "ami-0915bcb5fa77e4892"
  instance_type = "t3.micro"
  tags = {
    Name = "LaunchedWithTerraform",
  }
}