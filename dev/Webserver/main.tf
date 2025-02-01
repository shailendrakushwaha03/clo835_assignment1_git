# Define the provider
provider "aws" {
  region = "us-east-1"
}

# Data source for AMI id
data "aws_ami" "latest_amazon_linux" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# Use remote state to retrieve the data
data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "shailendra01"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}

# Define local variables
locals {
  env         = "dev"
  name_prefix = "myapp"
}

# Create the EC2
resource "aws_instance" "ec2" {
  ami           = data.aws_ami.latest_amazon_linux.id
  instance_type = var.instance_type
  key_name                    = aws_key_pair.web_key.key_name                                 
  subnet_id                   = data.terraform_remote_state.network.outputs.public_subnet_ids
  security_groups             = [aws_security_group.security-group.id]
  associate_public_ip_address = true

  tags = {
    Name = "dev-ec2"
  }
}

# Security Group for Dev EC2
resource "aws_security_group" "security-group" {
  name        = "dev-security-group"
  description = "Allow SSH and HTTP inbound traffic"
  vpc_id      = data.terraform_remote_state.network.outputs.vpc_id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    description = "Allow HTTP"
    from_port   = 8081
    to_port     = 8083
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "dev-security-group"
  }
}

# Adding SSH key to Amazon EC2
resource "aws_key_pair" "web_key" {
  key_name   = "key"
  public_key = file("key.pub") 
}

