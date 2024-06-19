variable "aws_access_key" {
  description = "AWS_ACCESS_KEY"
  type        = string
  default =""
  }
variable "aws_secret_key" {
  description = "AWS_SECRET_KEY"
  type        = string
  default =""
  }
variable "aws_session_token" {
  description = "AWS_ACCESS_TOKEN"
  type        = string
  default=""
  }
variable "key_name" {
  description = "AWS_KEY_NAME"
  type        = string
  default =""
  }
variable "instance_ami" {
  description = "AMI ID for the EC2 instances"
  type        = string
  default     = ""
}
variable "instance_type" {
  description = "Instance type for the EC2 instances"
  type        = string
  default     = ""
}
