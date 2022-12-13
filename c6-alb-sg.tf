
resource "aws_security_group" "alb-sg" {
  
  name = "ec2-alb-group"
  vpc_id = aws_vpc.Edf_vpc.id
  description = "The ec2 sg grp"

  ingress{
    description = "allow http from anywhere"
    cidr_blocks = [ "0.0.0.0/0" ]
    protocol = "tcp"
    to_port = 80
    from_port = 80
  }

  egress{
    description = "allow all outbound traffic"
    cidr_blocks = [ "0.0.0.0/0" ]
    protocol = "-1"
    to_port = 0
    from_port = 0
  }

  tags={
    "Name": "Edf-alb-sg"
  }
  
}