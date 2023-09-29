# Objetive
The objective of this "simple architecture" project is to create ONE instance (virtual machine).

![](https://d2908q01vomqb2.cloudfront.net/77de68daecd823babbb58edb1c8e14d7106e83bb/2021/06/15/VPC-Network-Engineers-Part-1-1.png)

[VPC](https://aws.amazon.com/blogs/apn/amazon-vpc-for-on-premises-network-engineers-part-one/)


This project will have a simple architecture:
- VPC -default
- subnet -default
- availability zone - eu-west-2 (London)
- resource name - EC2Ubuntu

![AWS Management Console website->EC2](https://github.com/BeatrizBravo/terraformONE/blob/main/aws/Simplearchitecture/images/EC2-wity-terraform-apply-simpleArquitectura.PNG)
# Requirements:
- AWS account
- user with appropriate permissions.
- Access key id and secret access Key.



# Configuration aws cli

- check what configuration you have in aws
```shell
aws configure list
```
- If you need to update your configuration
```shell
aws configure
```

- add aws access key (20 characteres)
- add aws secret access key  (30 characteres)
- add your defaul region name: eu-west-2
- default ouptut format [json[: empty
- enter

check again the configuration list

# Creating an empty  EC2 instance

```terraform
provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0eb260c4d5475b901"
  instance_type = "t2.micro"

  tags = {
    Name = "EC2Ubuntu"
  }
}
```



# Run the project
- Open the console
- go to the folder where you have store the main.tf file
- run the next commands:
```shell
terraform init
```
```shell
terraform apply
```
```shell
terraform apply
```
(you have to accept terraform apply!)

![Terraform output](https://github.com/BeatrizBravo/terraformONE/blob/main/aws/Simplearchitecture/images/terraform-apply-simpleArquitectura.PNG)
<br><br>
- go to the aws console on the browser and check EC2 instances

