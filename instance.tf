terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "web" {
  count 		= var.ec2_count
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  subnet_id		= "${var.subnet_id}"

  tags = {
    Name = "HelloWorld"
	Environment = "dev"
  }
}
