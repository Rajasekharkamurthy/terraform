resource "aws_instance" "my-ec2-vm" {
    ami = "ami-02e136e904f3da870"
    instance_type = "t2.micro"
    availability_zone = "us-east-1a"
    tags = {
      "Name" = "webserver"
    }
  
}