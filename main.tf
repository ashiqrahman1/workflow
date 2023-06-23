provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  instance_tenancy     = "default"
  tags = {
    Name = "VPC-${var.env}"
  }
}

resource "aws_subent" "public" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.101.0/24"
    tags = {
        Name = var.env
    }
}