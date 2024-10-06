# SecuritySting Website Infrastructure

This repository contains the Terraform configuration and associated files for deploying and managing the infrastructure of the SecuritySting website. 

## Table of Contents

- [Project Overview](#project-overview)
- [Getting Started](#getting-started)
- [Infrastructure Overview](#infrastructure-overview)
- [License](#license)

## Project Overview

This project automates the infrastructure provisioning for the SecuritySting website using [Terraform](https://www.terraform.io/). The configuration defines resources on cloud platforms such as AWS to build a scalable and secure environment.

## Getting Started

1. **Clone the repository**:
   ```bash
   git clone https://github.com/securitysting/website-infra-public.git
   cd website-infra-public

## Infrastructure Overview
The Terraform configuration in this repository provisions and manages several key infrastructure components, including:

- S3 Buckets: Object storage for static website content.
- IAM Roles and Policies: Role-based access control for AWS resources.
- CloudFront: Content delivery network to quickly serve content around the world.
- Lambda: Serverless function to run small nodejs code close to CloudFront.
- Certificate Manager: Certificate to encrypt web traffic hitting CloudFront for the `securitysting.com` domain.

## License
This project is licensed under the MIT License. See the LICENSE file for details.