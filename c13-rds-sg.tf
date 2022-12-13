
resource "aws_security_group" "rds-sg" {
  name = "rds-sg"
  vpc_id = aws_vpc.Edf_vpc.id
  description = "The sg for my rds "

  ingress{
    description = "allow port 3306"
    protocol = "tcp"
    to_port = 3306
    from_port = 3306
    cidr_blocks = [ var.vpc_cidr ]
  }

  egress{
     description = "allow port 3306"
    protocol = "-1"
    to_port = 0
    from_port = 0
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  tags = {
    "Name" = "rds-Edf-sg"
  }
}