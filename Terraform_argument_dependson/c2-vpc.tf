
#  create VPC
resource "aws_vpc" "vpc-dev" {
    cidr_block = "10.0.0.0/16"
    tags = {
      "Name" = "my-dev"
    }
}

#  create Subnet

resource "aws_subnet" "vpc-dev-pub-subnet1" {
    vpc_id = aws_vpc.vpc-dev.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true
}

#  create IGW

resource "aws_internet_gateway" "vpc-dev-igw" {
    vpc_id = aws_vpc.vpc-dev.id
  
}

#  create route table

resource "aws_route_table" "vpc-dev-route-table" {
    vpc_id = aws_vpc.vpc-dev.id
}

#  Create route in  route table for Internet access

resource "aws_route" "vpc-dev-route" {
    route_table_id = aws_route_table.vpc-dev-route-table.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc-dev-igw.id

  
}

# associate the route table with the subnet

resource "aws_route_table_association" "vpc-dev-route-table-subnet-association" {
    route_table_id = aws_route_table.vpc-dev-route-table.id
    subnet_id = aws_subnet.vpc-dev-pub-subnet1.id 
  
}

#create security group

resource "aws_security_group" "vpc-dev-sg" {
    name = "vpc-dev-default-sg"
    description = "dev vpc default vpc sg"
    vpc_id = aws_vpc.vpc-dev.id
  
  ingress {
    description = "Allow Port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow Port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all ip and ports outboun"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
