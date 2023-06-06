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
  region  = "eu-north-1"

}


#Resource to be created

resource "aws_instance" "app_server" {
  ami           = "ami-0989fb15ce71ba39e"
  instance_type = "t3.micro"
  key_name = "bb-key"

  tags = {
    Name = "Hoisin Duch Wrap Terraform"
  }


}
