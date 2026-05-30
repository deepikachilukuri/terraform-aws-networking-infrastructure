# Terraform AWS Networking Infrastructure

## Overview

This project uses **Terraform (Infrastructure as Code)** to provision a complete AWS networking environment. It demonstrates how to design and deploy a secure and scalable cloud network using core AWS services.

The infrastructure includes a custom VPC, public and private subnets, routing configuration, and EC2 provisioning with key pair generation.

---

## Architecture Components

This project provisions the following AWS resources:

* Custom **VPC**
* **Public Subnet** and **Private Subnet**
* **Internet Gateway (IGW)**
* **Route Tables and Associations**
* **Security Groups**
* **EC2 Instance Provisioning**
* **Key Pair Generation using TLS Provider**
* **Local Key File Storage**
* **RDP File Generation (for Windows access setup)**
* Network-related utilities (Random, Local, HTTP providers)

---

## Project Structure

```
.
├── main.tf
├── vpc.tf
├── public_subnet.tf
├── private_subnet.tf
├── igw.tf
├── routes.tf
├── variables.tf
├── providers.tf
├── outputs.tf
├── keys.tf
├── local.tf
├── random.tf
├── data.tf
├── network_insights.tf
├── rdp.tf
└── output.svg
```

---

## Prerequisites

Before running this project, ensure you have:

* Terraform installed
* AWS CLI configured
* An AWS account with appropriate IAM permissions

---

## Deployment Steps

### 1. Initialize Terraform

```bash
terraform init
```

### 2. Validate configuration

```bash
terraform validate
```

### 3. Plan infrastructure

```bash
terraform plan
```

### 4. Apply infrastructure

```bash
terraform apply
```

---

## Key Concepts Demonstrated

### AWS Networking

* VPC design with CIDR planning
* Public vs Private subnet isolation
* Route table configuration
* Internet Gateway integration

### Security

* Security group configuration
* Key pair generation for secure access

### Infrastructure as Code

* Modular Terraform configuration
* Declarative cloud provisioning
* State management concepts

---

## What I Learned

* Designing cloud network architecture using AWS
* Implementing Infrastructure as Code using Terraform
* Understanding routing, subnetting, and VPC design
* Automating infrastructure deployment
* Secure key management practices in cloud environments

---

## Important Security Notes

This repository excludes sensitive files such as:

* `.pem` private keys
* `terraform.tfstate`
* Password or encrypted files
* Local system-generated files

These are intentionally ignored using `.gitignore`.

---

## Future Improvements

* Add Auto Scaling Group (ASG)
* Integrate Application Load Balancer (ALB)
* Deploy 3-tier architecture (Web, App, DB layers)
* Add CI/CD pipeline using GitHub Actions
* Implement monitoring with CloudWatch

---

## Author

Built as part of AWS and Terraform hands-on learning and cloud engineering practice.

