data "aws_ami" "ec2_amzn2_ami_hvm" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name = "name"
    values = ["amzn2-ami-*"]
  }
  filter {
    name = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name = "architecture"
    values = ["x86_64"]
  }
  filter {
    name = "state"
    values = ["available"]
  }
}

resource "aws_instance" "ec2_instance" {
  count                       = "${var.instance_count}"
  ami                         = "${data.aws_ami.ec2_amzn2_ami_hvm.id}"
  instance_type               = "${var.instance_type}"
  subnet_id                   = "${var.subnet_id}"
  associate_public_ip_address = true
  monitoring                  = false
  key_name                    = "${var.key_name}"
  availability_zone           = "${var.availability_zone}"
  vpc_security_group_ids      = ["${aws_security_group.ec2_security_group.id}"]
  #User data field
  user_data                   = "${file("${path.module}/install.sh")}"
  
  tags = {
    Name = "user-data-instance-example"
  }
}

resource "aws_security_group" "ec2_security_group" {
  name        = "ec2_security_group_${var.env}"
  description = "Security group for the EC2 instance."
  vpc_id      = "${var.vpc_id}"

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # This allows SSH from AWS
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["${var.datacenter_cidr_block}"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["${var.office_cidr_block}"]
  }

  tags = {
    Name = "user-data-instance-example-security-group"
  }
}