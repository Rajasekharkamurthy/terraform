variable "aws_region" {
  description = "Region in which AWS resources to be created"
  type        = string
  default     = "us-east-1"

}

variable "aws_ami_id" {
  description = "AMI id"
  type        = string
  default     = "ami-02e136e904f3da870"

}


variable "ec2_instance_count" {
  description = "Instance_count"
  type        = number
  default     = 2


}