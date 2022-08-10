resource "aws_key_pair" "alter_key" {
    key_name = "alter_key"
    public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "Node1" {
  ami           = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t2.micro"
  key_name      = aws_key_pair.alter_key.key_name

  vpc_security_group_ids = [aws_security_group.allow-alter-ssh.id]
  subnet_id = aws_subnet.Python_Task.id

  tags = {
    Name = "Node1"
  }

}
resource "aws_instance" "Node2" {
  ami           = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t2.micro"
  key_name      = aws_key_pair.alter_key.key_name

  vpc_security_group_ids = [aws_security_group.allow-alter-ssh.id]
  subnet_id = aws_subnet.Python_Task.id

  tags = {
    Name = "Node2"
  }

}
