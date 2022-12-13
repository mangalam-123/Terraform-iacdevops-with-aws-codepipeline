
variable "aws_region"{
    description = "This is the region of my resources"
    type = string
    default = "us-east-1"
}

variable "instance_type" {
  description = "The instance type of my instance"
  type = string
  default = "t2.micro"
}

variable "instance_key" {
  description = "The instance key for my default instance"
  type = string
  default = "Tf_key"
}

variable "vpc_cidr" {
  description = "The cidr block of my whole infra"
  type = string
  default = "10.230.0.0/16"
}

variable "public_subnet" {
  description = "The public cidr block of my publci subnet"
  type = list(string)
  default = ["10.230.0.0/27", "10.230.0.32/27"]
}

variable "private_subnet" {
  description = "The private cidr block of my prvt subnet"
  type = list(string)
  default = ["10.230.0.64/27", "10.230.0.96/27"]
}

variable "db_subnet" {
  description = "The cidr block of my database subnet"
  type = list(string)
  default = ["10.230.0.128/27", "10.230.0.160/27"]
}

variable "Az" {
  description = "The availablity zone"
  type = list(string)
  default = [ "us-east-1a", "us-east-1b", "us-east-1c" ]
}