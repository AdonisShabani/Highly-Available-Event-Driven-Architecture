resource "aws_db_subnet_group" "subnet-group" {
  name       = "my-subnet-group"
  count = 1
  subnet_ids = [aws_subnet.private-subnets[0].id,aws_subnet.private-subnets[1].id]

  tags = {
    Name = "My DB subnet group"
  }
}