variable "aws_access_key" {
  default ="ASIA6CNX3H6YQ4Z4ZSP5"
  }
variable "aws_secret_key" {
  default ="gwQiT910Jfysx6IPyn6+VSlIG7LbifoH+oWQ13Xa"
  }
variable "aws_session_token" {
default="FwoGZXIvYXdzEFsaDNVdMNqQF1HLPQqcHyK3ASTbCZZZso3SOwn2UHCQMKZzvnk9YkAxE0UNrG37k6IieGDvE4xUPzroh2T9pM8pyc5zHmxCejLmPx89BoGKgFtsFAY0cgTloNkhcc6/Dy5OSsJHbIlB/fYiPN4+il2jWfXEizpaYk93pgokd23taN60vdDQcVJDiVL5tDAd5ZJM9dPXpUy65JLnl3nHfPlvt2Yjg+3+jFMyiqY2G/lHAJC4bcMpfNbGlKjzGd4+rqma+0vNLuioMCikob6zBjIt902XndYEIwRWzgJm7V/PnkARwdd2OmIRmizAbFHa61ow77LHFwbpALbYMzFv"
  }
variable "key_name" {
  default ="ec2pro2_pem"
  }

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
