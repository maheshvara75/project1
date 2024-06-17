variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_session_token" {}
variable "key_name" {}

variable "instance_ami" {
  description = "AMI ID for the EC2 instances"
  type        = string
  default     = "ami-04b70fa74e45c3917"
}
variable "instance_type" {
  description = "Instance type for the EC2 instances"
  type        = string
  default     = "t2.micro"
}
