resource "aws_vpc" "main" {
  cidr_block = var.network

  tags = {
    Name = var.name
  }
}

resource "aws_subnet" "main" {
  for_each                = toset(var.cidr_blocks)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[index(var.cidr_blocks, each.value) % (length(data.aws_availability_zones.available.names))]

  tags = {
    Name                                    = var.name
    "kubernetes.io/cluster/${var.name}-eks" = "shared"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.name
  }
}

resource "aws_default_route_table" "main" {
  default_route_table_id = aws_vpc.main.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = var.name
  }
}
