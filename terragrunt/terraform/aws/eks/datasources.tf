data "aws_vpc" "main" {
  tags = {
    Name = var.name
  }
}

data "aws_subnet_ids" "eks" {
  tags = {
    Name = var.name
  }

  vpc_id = data.aws_vpc.main.id
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}
