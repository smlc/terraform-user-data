variable "env" {
  type = "string"
  description = "Env staging, prod or dev"
}

variable "instance_count" {
  type = "string"
  description = "Number of EC2 instances to be created"
  default = 1
}

variable "instance_type" {
  type = "string"
  description = "The instance type we need to create for a particular environment"
  default = "t3a.micro"
}

variable "subnet_id" {
  type = "string"
  description = "The subnet we want to use with the EC2 instance"
}

variable "key_name" {
  type = "string"
  description = "The ec2 instance key name"
}

variable "vpc_id" {
  type        = "string"
  description = "Id of the VPC the warehouse cluster belongs to"
}

variable "datacenter_cidr_block" {
  type = "string"
  description = "IP range for datacenter"
}

variable "office_cidr_block" {
  type = "string"
  description = "IP range for the office"
}

variable "availability_zone" {
  type = "string"
  description = "Availability zone in which EC2 instance will be created"
  default = "eu-west-1"
}