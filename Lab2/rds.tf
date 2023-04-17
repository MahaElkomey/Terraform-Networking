#The DB subnet group defines which subnets and IP ranges the DB instance can use in the VPC that you selected
resource "aws_db_subnet_group" "database_subnet_group" { 
  name = "database_subnet_group"
  subnet_ids = [module.my_network.private_subnet_1_id, module.my_network.private_subnet_2_id]
}

resource "aws_db_instance" "mysql" {
  identifier = "mydb"
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "maha"
  password             = "maha1999"
  allocated_storage = 20
  port = 3306
  vpc_security_group_ids = [aws_security_group.database_sg.id]
  availability_zone = var.AZ_1
  db_subnet_group_name = aws_db_subnet_group.database_subnet_group.name
  skip_final_snapshot  = true
}