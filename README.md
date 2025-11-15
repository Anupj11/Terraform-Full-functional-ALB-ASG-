# 🚀 AWS Auto Scaling Group + Application Load Balancer (ALB) Infrastructure using Terraform  
### Fully Automated, Production-Ready, Highly Available Deployment Architecture

This project deploys a **complete AWS infrastructure** using Terraform, including:

- **Custom VPC**
- **Public Subnets across 2 AZs**
- **Internet Gateway + Route Tables**
- **Application Load Balancer (ALB)**
- **Target Group + Listener**
- **Launch Template (with Nginx User Data)**
- **Auto Scaling Group (ASG)**
- **Security Groups**
- **Dynamic EC2 Scaling with Public IP Assignment**

This is a fully functional, real-world, production-grade AWS architecture.

---

# 📘 **Architecture Overview**

            ┌──────────────────────────────────────────┐
            │               Application LB             │
            │         (ALB - Internet Facing)          │
            └────────────┬─────────────────────────────┘
                         │
                        ▼
            ┌──────────────────────────────┐
            │       Target Group (TG)      │
            └──────────────────────────────┘
                         │
            ┌──────────────────────────────┐
            │  Auto Scaling Group (ASG)    │
            │  - Multi AZ Deployment       │
            │  - Launch Template (LT)      │
            └──────────────────────────────┘
                 ▲                    ▲
           EC2 Instance        EC2 Instance
           (ap-south-1a)       (ap-south-1b)
           Public Subnet       Public Subnet

        ┌─────────────────────────────────────────────┐
        │                 Custom VPC                  │
        └─────────────────────────────────────────────┘

          
🟩 Networking

Custom VPC creation

Multi-AZ subnets

Route tables & IGW

Public IP management

🟩 Compute

Launch Template

Auto Scaling Group

Lifecycle management

Automated Nginx provisioning (user data)

🟩 Load Balancing & High Availability

Application Load Balancer

Listener rules

Target groups

Health checks

🟩 Security

Security Group design (least privilege)

VPC-level isolation

Public networking restrictions

🟩 Terraform Best Practices

File/module separation (vpc.tf, alb.tf, asg.tf)

Variables and outputs

Use of filebase64() user data

Dependency mapping using references

Reusable, readable code structure

---

## 👨‍💻 **Author**

**<span style="font-size:18px; font-weight:700;">Anup Jadhav</span>**  
**AWS Cloud & DevOps Engineer**  
📧 **Email:** [jadhavanup15@gmail.com](mailto:jadhavanup15@gmail.com)

---
