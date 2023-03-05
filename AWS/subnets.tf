resource "aws_subnet" "public-subnets" {
  vpc_id            = aws_vpc.vpc.id
  count             = 2
  cidr_block        = "10.0.${count.index + 1}.0/24"
  availability_zone = element(var.availability_zone, count.index)

  tags = {
    Name = "Public-subnet"
  }
}


resource "aws_subnet" "private-subnets" {
  vpc_id            = aws_vpc.vpc.id
  count             = 2
  cidr_block        = "10.0.${count.index + 3}.0/24"
  availability_zone = element(var.availability_zone, count.index)


  tags = {
    name = "Private-subnet"
  }
}


resource "aws_route_table" "route-table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "PublicRT"
  }
}

resource "aws_route_table_association" "a" {
  count          = 2
  subnet_id      = aws_subnet.public-subnets[count.index].id
  route_table_id = aws_route_table.route-table.id

}









