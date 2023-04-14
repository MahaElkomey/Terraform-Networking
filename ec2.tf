# RSA key of size 4096 bits
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# ec2 publlic key 
resource "aws_key_pair" "ec2_key" {
  key_name   = "ec2_key"
  public_key = tls_private_key.rsa.public_key_openssh
}

# store our key
resource "local_file" "ec2_key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "ec2_private_key"
}
# create bastion EC2 instance 
resource "aws_instance" "bastion" {
  ami           = "ami-06e46074ae430fba6" #Amazon Linux AMI
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public1.id
  vpc_security_group_ids = [aws_security_group.public_sg.id]
  key_name = "ec2_key"
}

# create application EC2 instance 
resource "aws_instance" "application" {
  ami           = "ami-06e46074ae430fba6" #Amazon Linux AMI
  instance_type = "t2.micro"
  subnet_id = aws_subnet.private1.id
  vpc_security_group_ids = [aws_security_group.private_sg.id]
  key_name = "ec2_key"
}

