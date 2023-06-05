#create AWS EC2 Instance


terraform {

# provider details=> console=>  terraform init
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}



# Configure the AWS Provider
provider "aws" {
  region  = "us-west-2"
}


#Resource to be created

resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name = "BB-server with Terraform"
  }


}
