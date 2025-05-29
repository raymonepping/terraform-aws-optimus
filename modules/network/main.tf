resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name        = var.vpc_name
    ProjectName = var.project_name
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.vpc_name}-igw"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.az
  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.vpc_name}-public-subnet"
    ProjectName = var.project_name
  }
}

resource "aws_subnet" "sdn_dcgw_interconnect" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.sdn_dcgw_subnet_cidr
  availability_zone       = var.az
  map_public_ip_on_launch = false

  tags = {
    Name        = "${var.vpc_name}-sdn-dcgw-interconnect"
    ProjectName = var.project_name
    Role        = "SDN-DCGW-INTERCONNECT"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_security_group" "ssh" {
  name        = "allow-ssh"
  description = "Allow SSH inbound"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "ssh-access"
    ProjectName = var.project_name
  }
}
