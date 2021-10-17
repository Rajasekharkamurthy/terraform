# Create EC2 Instance
resource "aws_instance" "web" {
  ami           = "ami-047a51fa27710816e" # Amazon Linux
  instance_type = "t2.micro"
  count         = 3
  tags = {
    "Name" = "web-${count.index}"
  }
}