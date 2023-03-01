resource "aws_subnet" "subnet" {
  for_each          = var.subnets
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone
  vpc_id            = aws_vpc.vpc.id
}


resource "aws_route_table" "route-tabels" {
  vpc_id = aws_vpc.vpc.id

  route = []

  tags = {
    Name = "Private-RT"
  }
}

resource "aws_route_table_association" "private_subnet_association" {
  for_each = {
    for subnet_name, subnet in var.subnets :
    subnet_name => subnet if contains(["private-subent-1a", "private-subent-1b"], subnet_name)
  }

  subnet_id      = aws_subnet.subnet[each.key].id
  route_table_id = aws_route_table.route-tabels.id
}