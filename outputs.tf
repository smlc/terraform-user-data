output "ec2_instance_id" {
  value = "${module.aws_ec2.ec2_instance_id}"
}

output "ec2_instance_private_ip" {
  value = "${module.aws_ec2.ec2_instance_private_ip}"
}