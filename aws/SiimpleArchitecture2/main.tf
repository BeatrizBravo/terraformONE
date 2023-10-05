provider "aws" {
  region = "us-west-2"
}


//Security group: Have access to the instance and from the instance to the internet
resource "aws_security_group" "instance" {
  name = "terraform-example-sg" //group name



  //Traffic entry and exit policy
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    //CIDR: From what IP we can enter
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" //can go anywhere
    cidr_blocks = ["0.0.0.0/0"]
  }
}

//Empty instance
resource "aws_instance" "web" {
  ami = "ami-0f3769c8d8429942f"
  instance_type = "t2.micro"


  vpc_security_group_ids = [aws_security_group.instance.id]  //Refers to the SG created on line 8.

  ////user_data = code block that allows nginx to be installed        ...EOF= end of file
  // installing nginx
  user_data = <<-EOF
    #!/bin/bash
    sudo apt update
    sudo apt install apache2 -y
    sudo systemctl start apache2
  EOF

  tags = { //instanceName
    Name = "HelloWorld"
  }
}