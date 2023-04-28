resource "aws_vpc" "prod_vpc_1" {
  cidr_block = var.cidr
  tags = {
    Name = format("%s-vpc", var.env)
  }
}

resource "aws_internet_gateway" "prod_ig" {
#   vpc_id = aws_vpc.prod_vpc.id
    vpc_id = aws_vpc.prod_vpc_1.id
  tags = {
    "Name" = var.env
  }
}


resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.prod_vpc_1.id
  cidr_block = var.public_subnet_cidr

  tags = {
    Name = "public_subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.prod_vpc_1.id
  cidr_block = var.private_subnet_cidr

  tags = {
    Name = "private_subnet"
  }
}


resource "aws_nat_gateway" "prod_ng" {
  subnet_id = aws_subnet.public_subnet.id
  allocation_id = aws_eip.prod_eip.id
  connectivity_type = "public"

  tags = {
    Name = format("%s-ng", var.env)
  }
}


resource "aws_eip" "prod_eip" {
  vpc              = true
#   public_ipv4_pool = "ipv4pool-ec2-012345"
  tags = {
    Name = format("%s-eip", var.env)
  }
}


resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.prod_vpc_1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.prod_ig.id
  }

  tags = {
    Name = "public_route_table"
  }
}


resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.prod_vpc_1.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.prod_ng.id
  }

  tags = {
    Name = "private_route_table"
  }
}


resource "aws_route_table_association" "private_route_table_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "public_route_table_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}


// Modules, output.tf, locals, workspace, data , for_each
