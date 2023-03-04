# resource "aws_db_subnet_group" "subnet-group" {
#   name       = "my-subnet-group"
#   count      = 1
#   subnet_ids = [aws_subnet.private-subnets[0].id, aws_subnet.private-subnets[1].id]

#   tags = {
#     Name = "My DB subnet group"
#   }
# }

# resource "aws_security_group" "security-group-db" {

#   vpc_id = aws_vpc.vpc.id

#   ingress {
#     description = "MYSQL"
#     from_port   = 3306
#     to_port     = 3306
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }




#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   tags = {
#     Name = "MY-SQL"
#   }
# }


# resource "aws_db_instance" "database" {
#   engine                  = "mysql"
#   instance_class          = "db.t2.micro"
#   allocated_storage       = 100
#   db_name                 = "MyDatabase"
#   username                = var.db-username
#   password                = var.db-password
#   db_subnet_group_name    = aws_db_subnet_group.subnet-group[count.index].name
#   count                   = 1
#   multi_az                = true
#   vpc_security_group_ids  = [aws_security_group.security-group-db.id]
#   backup_retention_period = 7
#   skip_final_snapshot     = true


#   depends_on = [
#     aws_subnet.private-subnets
#   ]
# }

# resource "aws_db_instance" "database-replica" {
#   count               = 1
#   instance_class = "db.t2.micro"
#   replicate_source_db = aws_db_instance.database[count.index].id
#   password            = var.db-password
#   skip_final_snapshot = true
# }