resource "aws_vpc" "Edf_vpc" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support = true

  tags={
    "Name": "Edf_vpc"
  }
}

resource "aws_internet_gateway" "Edf_igw" {
  vpc_id = aws_vpc.Edf_vpc.id
  tags = {
    "Name": "Edf_igw"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.Edf_vpc.id
  route{
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Edf_igw.id
  }

  tags = {
    "Name": "Edf_pub_rt"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.Edf_vpc.id
  tags = {
    "Name": "Edf_prvt_rt"
  }
}

resource "aws_subnet" "pub_subnet" {
  count = length(var.public_subnet)
  vpc_id = aws_vpc.Edf_vpc.id
  cidr_block = element(var.public_subnet, count.index)
  availability_zone = element(var.Az, count.index)
  map_public_ip_on_launch = true

  tags={
    "Name": "Edf_pub_subnet"
  }
}

resource "aws_route_table_association" "pub-sub-rt" {
  count = length(var.public_subnet)
  subnet_id = element(aws_subnet.pub_subnet.*.id, count.index)
  route_table_id = aws_route_table.public_rt.id
}


resource "aws_subnet" "prvt_subnet" {
  count = length(var.private_subnet)
  vpc_id = aws_vpc.Edf_vpc.id
  cidr_block = element(var.private_subnet, count.index)
  availability_zone = element(var.Az, count.index)

  tags={
    "Name": "Edf_prvt_subnet"
  }
}

resource "aws_subnet" "database_subnet" {
  count = length(var.db_subnet)
  vpc_id = aws_vpc.Edf_vpc.id
  cidr_block = element(var.db_subnet, count.index)
  availability_zone = element(var.Az, count.index)

  tags={
    "Name": "Edf_db_subnet"
  }
}

resource "aws_route_table_association" "db-sub-rt" {
  count = length(var.db_subnet)
  subnet_id = element(aws_subnet.database_subnet.*.id, count.index)
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "prvt-sub-rt" {
  count = length(var.private_subnet)
  subnet_id = element(aws_subnet.prvt_subnet.*.id, count.index)
  route_table_id = aws_route_table.private_rt.id
}

