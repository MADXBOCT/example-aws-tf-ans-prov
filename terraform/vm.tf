# ADD PUBLIC KEY TO AWS. IT WILL BE USED DURING VM CREATION
resource "aws_key_pair" "aws_key" {
  key_name   = "aws_key"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

# SETUP SECURITY GROUP - AWS FIREWALL
resource "aws_security_group" "sg_node" {
  name = "sg_k8s"
  # Any incoming traffic is allowed
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # Any outgoing traffic is allowed
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 INSTANCE FOR MASTER
resource "aws_instance" "node1" {
  ami           = var.AMIS["ubuntu"]
  instance_type = var.INSTANCE_TYPE
  # Add previously generated public key to VM
  key_name = aws_key_pair.aws_key.key_name
  # Add VM to security group
  vpc_security_group_ids = [aws_security_group.sg_node.id]
  tags = {
     Name = "node1"
  }
}