resource "aws_instance" "my-ec2-vm" {
    ami = "ami-02e136e904f3da870"
    instance_type = "t2.micro"
    key_name = "ec2key"
    subnet_id = aws_subnet.vpc-dev-pub-subnet1.id
    vpc_security_group_ids = [ aws_security_group.vpc-dev-sg.id ]
    user_data = file("apache-install.sh")

    /**user_data = <<-EOF
     #! /bin/bash
     sudo yum update -y
     sudo yum install -y httpd
     sudo service httpd start  
     sudo systemctl enable httpd
     echo "<h1>Welcome to StackSimplify ! AWS Infra created using Terraform in us-east-1 Region</h1>" > /var/www/html/index.html
     EOF **/

}