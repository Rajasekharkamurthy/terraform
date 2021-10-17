# Create EC2 Instance
resource "aws_instance" "my-ec2-vm" {
  ami           = var.aws_ami_id
  instance_type = "t2.micro"
  key_name      = "ec2key"
  count         = var.ec2_instance_count
  user_data     = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install httpd -y
    sudo systemctl enable httpd
    sudo systemctl start httpd
    echo "<h1>Welcome to StackSimplify ! AWS Infra created using Terraform in us-east-1 Region</h1>" > /var/www/html/index.html
    EOF

  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]


  tags = {
    "Name" = "myec2vm"
  }
}