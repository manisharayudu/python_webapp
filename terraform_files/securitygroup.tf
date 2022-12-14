resource "aws_security_group" "allow-alter-ssh" {
  vpc_id      = aws_vpc.Python_Task.id
  name        = "allow-alter-ssh"
  description = "security group that allows ssh connection"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description      = "Allow from Personal CIDR block"
    from_port        = 8000
    to_port          = 8000
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow-alter-ssh"
  }
}

#Security group for AWS ELB
resource "aws_security_group" "alter-elb-securitygroup" {
  vpc_id      = aws_vpc.Python_Task.id
  name        = "alter-elb-securitygroup"
  description = "security group for Elastic Load Balancer"
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "alter-elb-securitygroup"
  }
}
