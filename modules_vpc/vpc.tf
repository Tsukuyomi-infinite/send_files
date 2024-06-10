resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
 
  tags = {
    Name = "main-vpc"
  }
}
 
resource "aws_subnet" "public" {
vpc_id = aws_vpc.main.id
  cidr_block        = var.public_subnet_cidr
  map_public_ip_on_launch = true
 
  tags = {
    Name = "public-subnet"
  }
}
 
resource "aws_subnet" "private" {
vpc_id = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr
 
  tags = {
    Name = "private-subnet"
  }
}
 
resource "aws_subnet" "db" {
vpc_id = aws_vpc.main.id
  cidr_block = var.db_subnet_cidr
 
  tags = {
    Name = "db-subnet"
  }
}
 
resource "aws_internet_gateway" "gw" {
vpc_id = aws_vpc.main.id
 
  tags = {
    Name = "internet-gateway"
  }
}
 
resource "aws_route_table" "public" {
vpc_id = aws_vpc.main.id
 
  route {
    cidr_block = "0.0.0.0/0"
gateway_id = aws_internet_gateway.gw.id
  }
 
  tags = {
    Name = "public-route-table"
  }
}
 
resource "aws_route_table_association" "public" {
subnet_id = aws_subnet.public.id
route_table_id = aws_route_table.public.id
}
 
resource "aws_nat_gateway" "nat" {
allocation_id = aws_eip.nat.id
subnet_id = aws_subnet.public.id
 
  tags = {
    Name = "nat-gateway"
  }
}
 
resource "aws_eip" "nat" {
  vpc = true
}
 
resource "aws_route_table" "private" {
vpc_id = aws_vpc.main.id
 
  route {
    cidr_block     = "0.0.0.0/0"
nat_gateway_id = aws_nat_gateway.nat.id
  }
 
  tags = {
    Name = "private-route-table"
  }
}
 
resource "aws_route_table_association" "private" {
subnet_id = aws_subnet.private.id
route_table_id = aws_route_table.private.id
}
 
resource "aws_route_table" "db" {
vpc_id = aws_vpc.main.id
 
  tags = {
    Name = "db-route-table"
  }
}
 
resource "aws_route_table_association" "db" {
subnet_id = aws_subnet.db.id
route_table_id = aws_route_table.db.id
}