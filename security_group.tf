# security group NO.7
resource "aws_security_group" "public_sg" {
  name        = "public_sg"
  vpc_id      = aws_vpc.mainVpc.id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

#########################################################

# security group NO.8
resource "aws_security_group" "private_sg" {
  name        = "private_sg"
  vpc_id      = aws_vpc.mainVpc.id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.mainVpc.cidr_block]
  }

  ingress {
    from_port        = 3000
    to_port          = 3000
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.mainVpc.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" # mraning all trafic
    cidr_blocks      = ["0.0.0.0/0"]
  }
}