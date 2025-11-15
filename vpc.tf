resource "aws_vpc" "terra_vpc" {

  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "terra-vpc"
  }
}

resource "aws_subnet" "subnet1" {

  vpc_id            = aws_vpc.terra_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "first-public-subnet"
  }

}

resource "aws_subnet" "subnet2" {
  vpc_id            = aws_vpc.terra_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-2"
  }

}

resource "aws_internet_gateway" "IGW" {

  vpc_id = aws_vpc.terra_vpc.id

  tags = {
    Name = "terra-IGW"
  }

}

resource "aws_route_table" "RT" {
  vpc_id = aws_vpc.terra_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }


}

resource "aws_route_table_association" "RT_association" {
  route_table_id = aws_route_table.RT.id
  subnet_id      = aws_subnet.subnet1.id

}

resource "aws_route_table_association" "RT_association2" {
  route_table_id = aws_route_table.RT.id
  subnet_id      = aws_subnet.subnet2.id

}

