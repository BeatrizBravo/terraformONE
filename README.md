<!-- TOC -->
* [Introduction](#introduction)
* [Infrastructure as Code](#infrastructure-as-code)
* [Terraform](#terraform)
* [Installation for a Windows machine](#installation-for-a-windows-machine)
  * [Wsl](#wsl)
    * [How to use ubuntu in window](#how-to-use-ubuntu-in-window)
  * [AWS cli](#aws-cli)
  * [Terraform](#terraform-1)
    * [Install Terraform](#install-terraform)
    * [The code](#the-code)
* [Execute terraform](#execute-terraform)
<!-- TOC -->

# Introduction
[This project](https://github.com/BeatrizBravo/terraformONE/tree/securityGroup/aws/intro-readme) is going to create an instance in AWS, using terraform.
# Infrastructure as Code
Manage infrastructure in a programmable way.<br>
Before you  used to have a clear distinction between software and hardware. <br>
Over time, virtual machines were created to make the use of hardware more efficient and to create multiple simulated environments or dedicated resources from a single physical hardware system. Today you can use AWS, Azure, Google, etc. to create virtual machines, but each provider has its way of configuring the VMs, but that is why Terraform comes into play helping centralize and automate the creation of resources in the cloud.<br>
# Terraform

Terraform is an open-source infrastructure as code tool that enables you to safely and predictably provision , change, and manage infrastructure in any cloud. <br>
Terraform uses a specialized programming language for defining infrastructure , called Hashicorp Configuration Language (HCL). HCL code is human-readable and declarative , and it lets you define resources and infrastructure in manageable and scalable configuration files , which Terraform then manages the lifecycle of. <br>
Terraform lets you define both cloud and on-prem resources in human-readable configuration files that you can version control, collaborate on, and manage with greater speed, efficiency, and confidence.<br>
More info in here [here](https://learn.microsoft.com/en-us/azure/developer/terraform/overview).

# Installation for a Windows machine
## Wsl
1. Open powershell and run:
```bash
wsl --install -d ubuntu
```
2. It is going to ask you to set up a password. Create one and keep it in a safe place to remember.
<br>

3. Check your version
```bash
 wsl -l -v
```
### How to use ubuntu in window
type in powershell
```bash
wsl
```

[more info ](https://learn.microsoft.com/es-es/windows/wsl/install?ranMID=46128&ranEAID=mP6UMnc5Ozo&ranSiteID=mP6UMnc5Ozo-4PK.bdGbjdh.4z10f03FhQ&epi=mP6UMnc5Ozo-4PK.bdGbjdh.4z10f03FhQ&irgwc=1&OCID=AID2200057_aff_7794_1243925&tduid=(ir__ershtj3f6gkfby6ixfto2r3qsu2xex2yzth0k9jv00)(7794)(1243925)(mP6UMnc5Ozo-4PK.bdGbjdh.4z10f03FhQ)()&irclickid=_ershtj3f6gkfby6ixfto2r3qsu2xex2yzth0k9jv00)
<br>

## AWS cli
1. Open powershell and type :


```bash
wsl
```

2.  Update your system
<br>
(It is going be asking you for permissions, use the password you set up before.)
<br>

   ```bash
sudo apt update && sudo apt upgrade -y 
```
<br>
  
3. Run
```bash
 sudo apt install awscli
 ```

<br>

4. Check your version
```bash
 aws --version
```
5. Connect aws cli with your aws:
   - Go to the AWS Management Console website (https://console.aws.amazon.com/) and sign in using your AWS account credentials.
   - Open the IAM service: Once you are signed in, search for "IAM" in the AWS Management Console search bar and select the "IAM" service from the results.
   - click on "Users" in the navigation pane on the left side of the screen. This will take you to the "Users" page where you can manage your IAM users.
   - Another option is go the top right where is your profile email
   - click on "My security credentials". 
   - Roll down to see the option Access key
   - click on "Access keys" and "create Access key"
   - select --> Command Line Interface (CLI)
   - click on "next"
   - Copy:
        - Access key
        - Secret access Key


6. Open powershell and type :


```bash
wsl
```
7. Configure aws cli :  

```bash
aws configure
```
<br>
Example

```bash
AWS Access Key ID [None]: Write-your-Access-key
AWS Secret Access Key [None]: wWrite-your-Secret-access-Key
Default region name [None]: eu-north-1  (check  your region to choose)
Default output format [None]: json
```


## Terraform

### Install Terraform

1. Open powershell and type :

```bash
wsl
```

2.  Update your system

```bash
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common 
```
3. Run
```bash
sudo apt install wget unzip 
```
<br>

  
4. Add the HashiCorp GPG key to your keyring by running:
```bash
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

```
5. Add the HashiCorp apt repository to your system's list of sources:

```bash
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

```

6. Run
```

sudo apt update
 
```

7. Finally, install Terraform by running:

```
sudo apt install wget unzip 

```


9. Check your version
```bash
 terraform version

```

<br>


[If terraform is not working follow this link ](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) and watch the video on the minute 5:55 to install Terraform in Linux, throw wsl.

### The code
```terraform
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
    Name = "Hoisin Duch Wrap Terraform 2.0"
  }


}
```

# Execute terraform
1. Open powershell and type :


```bash
wsl
```

2. Navigate to aws directory, where is containing "main.tf".
<br>

3. Initialize terraform 
```bash
 terraform init

```
3. Plan terraform 
```bash
 terraform plan

```

4. Apply terraform 
```bash
 terraform apply

```
The console will ask you => 
<br>
Enter a value:
```bash
yes

```
5. Check your work:
```bash
 Go aws services --> EC2 Dashboard  --> Instances(running).

```
