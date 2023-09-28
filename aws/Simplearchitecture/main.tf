provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0eb260c4d5475b901"
  instance_type = "t2.micro"

  tags = {
    Name = "EC2Ubuntuxx"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nginx",
      "sudo systemctl start nginx"
    ]

  }

#  vpc_security_group_ids = [aws_security_group.instance.id] # It does reference to the next security we are going to create

#  user_data = <<-EOF
#              #!bin/bash
##              sudo amazon-linux-extras install nginx1.12 -y
##              sudo service nginx start
#                sudo apt update
#                sudo apt install nginx
#                sudo ufw allow 'Nginx HTTP'
#                curl -4 icanhazip.com
#              EOF
}

#resource "aws_security_group" "instance" {
#  name        = "example-security-group-terraform"
#  description = "Example security group-terraform"
#
#  ingress {
#    from_port   = 80
#    to_port     = 80
#    protocol    = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#
#  egress {
#    from_port   = 0 # anywhere
#    to_port     = 0
#    protocol    = "-1"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#
#
#
#
#}





