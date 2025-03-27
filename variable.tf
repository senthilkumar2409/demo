variable "vpc_cidr_block"  {
    default = "192.0.0.0/20"
}

variable "subnet_public_cidr_block" {
  default = ["192.0.0.0/23","192.0.2.0/23","192.0.4.0/23"]
  type = list(string)
}

variable "subnet_az" {
 default = ["us-east-1a","us-east-1b","us-east-1c"]
}

variable "instance_type" {
  default = ["t2.micro", "t3.micro", "t2.medium"]
}