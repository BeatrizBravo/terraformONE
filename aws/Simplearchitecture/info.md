# Objetive
The objective of this "simple architecture" project is to create a virtual machine that will have a simple architecture where it:
- VPC -default
- subnet -default
- availability zone - eu-west-2 (London)
- resource name - EC2Ubuntu
![aws result](images/simpleArchitecture.PNG)

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
(ou have to accept terraform apply)
![apply output](images/apply.png)
<br><br>
- go to the aws console on the browser and check EC2 instances

