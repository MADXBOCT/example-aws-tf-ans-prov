provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "node1" {
  ami           = "ami-0c94855ba95c71c99"
  instance_type = "t2.micro"
  subnet_id     = "subnet-0c93d46fa03982829"
  tags = {
    Name = "node1"
  }
}