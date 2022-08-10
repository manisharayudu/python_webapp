resource "aws_vpc" "Python_Task" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"

  tags = {
    Name = "Python_Task"
  }
}

# Public Subnets in Custom VPC
resource "aws_subnet" "Python_Task" {
  vpc_id                  = aws_vpc.Python_Task.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-central-1a"

  tags = {
    Name = "Python_Task"
  }
}

# Private Subnets in Custom VPC
resource "aws_subnet" "altervpc-private-1" {
  vpc_id                  = aws_vpc.Python_Task.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-central-1a"

  tags = {
    Name = "altervpc-private-1"
  }
}

# Custom internet Gateway
resource "aws_internet_gateway" "alter-gw" {
  vpc_id = aws_vpc.Python_Task.id

  tags = {
    Name = "alter-gw"
  }
}

#Routing Table for the Custom VPC
resource "aws_route_table" "Python_Task" {
  vpc_id = aws_vpc.Python_Task.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.alter-gw.id
  }

  tags = {
    Name = "alter-public-1"
  }
}

resource "aws_route_table_association" "alter-public-1-a" {
  subnet_id      = aws_subnet.Python_Task.id
  route_table_id = aws_route_table.Python_Task.id
}
