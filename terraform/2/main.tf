provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "ManagedByTerraform"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "ManagedByTerraform"
  }
}

resource "aws_instance" "web" {
  ami = "ami-0915bcb5fa77e4892"
  instance_type = "t3.micro"
  subnet_id   = aws_subnet.subnet1.id
  tags = {
    Name = "LaunchedWithTerraform",
  }
}