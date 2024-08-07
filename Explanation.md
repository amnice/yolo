# Explanation of files and their roles
## main.tf file
The `main.tf` file is a Terraform configuration file used to define the desired state of infrastructure resources. In this file, AWS provider configuration is specified, including the region and access credentials. It then declares two AWS resources: a security group (`aws_security_group`) and two EC2 instances (`aws_instance`). The security group defines inbound and outbound rules for network traffic, while the EC2 instances specify the machine image (AMI), instance type, and associated security group. Additionally, it contains provisioner blocks for running Ansible playbooks (`ansible-playbook`) on the provisioned instances.

## terraform.tfvars
This file contains variable assignments for Terraform configurations. Specifically, it sets the path to the private key (`id_rsa`) used for SSH access to the EC2 instances. The value is typically kept outside version control for security reasons and provided during Terraform execution.

## vars.tf
The vars.tf file defines Terraform input variables. These variables are used to parameterize Terraform configurations, allowing for dynamic values to be passed into the configuration. In this case, it declares variables for AWS access and secret keys (`accesskey` and `securitykey`) and the path to the private key (`id_rsa`). This file is usually ignored by version control systems like Git to prevent sensitive data exposure.
