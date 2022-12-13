
# resource "aws_db_instance" "Edf_rds"{
  
#   identifier = "Edf-rds"
#   allocated_storage    = 10
#   db_name              = "mydb"
#   engine               = "mysql"
#   engine_version       = "5.7"
#   instance_class       = "db.t3.micro"
#   username             = "admin"
#   password             = "admin123"
#   db_subnet_group_name = "db-sub-grp"
#   vpc_security_group_ids = [ aws_security_group.rds-sg.id ]
#   skip_final_snapshot  = true

# }

resource "aws_db_instance" "demo-rds-inst"{

  identifier = "my-sample-db"
  db_name = "sample-db"
  allocated_storage = 10
  instance_class = "db.t2.micro"
  engine = "MySQL"
  engine_version = "8.0.28"
  username = "admin"
  password = "admin123"
  vpc_security_group_ids = [aws_security_group.rds-sg.id]
  db_subnet_group_name = "db-sub-grp"
  skip_final_snapshot = true


}