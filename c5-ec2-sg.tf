
resource "aws_security_group" "ec2-sg01" {
  
  name = "ec2-security-group"
  vpc_id = aws_vpc.Edf_vpc.id
  description = "The ec2 sg grp"

  ingress{
    description = "allow ssh from anywhere"
    cidr_blocks = [ "0.0.0.0/0" ]
    protocol = "tcp"
    to_port = 22
    from_port = 22
  }

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
    "Name": "Edf-ec2-sg"
  }
  
}