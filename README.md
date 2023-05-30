# Terraform-Networking

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

I've used Terraform to deploy infrastructure on AWS 💻 , and the results are amazing. It was a challenging but rewarding experience, and I learned so much along the way.

👩‍💻 It was about:

✅ Created a VPC with public and private subnets in multiple availability zones
✅ Launched EC2 instances with public and private IPs and configured security groups to allow SSH access
✅ Deployed RDS and Elasticache with subnet groups in the private subnets
✅ Write a script to prepare the environment for public instances to auto-connect to RDS and Elasticache DB and to connect to private instances.
✅ Set up two workspaces (dev and prod) with variable definition files for each environment
✅ Used modules to organize my code and improve reusability
✅ Leveraged AWS Secrets Manager to securely store database credentials
✅ Used a local-exec provisioner to print the public IP of the Bastion EC2 instance
✅ Set up an email notification system using SES and Lambda to send an email if any update happened to the production workspace


![1682864599313](https://github.com/MahaElomey/Terraform-Networking/assets/47718954/57a9163f-99f3-43cd-94af-074a359a3b6b)
