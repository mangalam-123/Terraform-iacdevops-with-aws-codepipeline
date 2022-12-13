
# resource "aws_instance" "Edf_ec2" {
#   ami = data.aws_ami.linux2.id
#   instance_type = var.instance_type
#   key_name = var.instance_key
#   vpc_security_group_ids = [aws_security_group.ec2-sg01.id]
#   subnet_id = aws_subnet.pub_subnet[0].id
#   availability_zone = element(var.Az, 0)
#   user_data = file("${path.module}/custom.sh")

#   tags = {
#     "Name": "Edf_ec2"
#   }

# }

resource "aws_instance" "Edf_ec2" {
  
  ami = data.aws_ami.linux2.id
  instance_type = var.instance_type
  key_name = var.instance_key
  vpc_security_group_ids = [aws_security_group.ec2-sg01.id]
  subnet_id = aws_subnet.pub_subnet[0].id
  availability_zone = element(var.Az, 0)
  user_data = file("${path.module}/custom.sh")
  count = 2
  tags = {
    "Name": "ec2-instance"
  }
}