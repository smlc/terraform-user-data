#Ignore other part...

module "aws_ec2" {
  source                      = "./modules/aws_ec2"
  env                         = "prod"
  instance_count         = 1
  subnet_id                   = "subnet-1111aaaa"
  vpc_id                      = "vpc-1111aaaa"
  datacenter_cidr_block       = "10.0.0.0/8"
  office_cidr_block           = "192.168.0.0/16"
  key_name                    =  "ec2_instance_key"
}