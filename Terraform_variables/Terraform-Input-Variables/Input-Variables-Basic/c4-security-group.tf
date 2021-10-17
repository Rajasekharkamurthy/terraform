# Create Security Group - SSH Traffic

resource "aws_security_group" "vpc-ssh" {
  name        = "vpc-ssh"
  description = "Dev vpc SSH"

  ingress {
    description = "allow port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {

    description = "allow all IP  ports and outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
}


# Create Security Group - Web Traffic

resource "aws_security_group" "vpc-web" {
  name        = "vpc-web"
  description = "Dev vpc web"

  ingress {
    description = "allow port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {

    description = "allow all IP  ports and outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
}