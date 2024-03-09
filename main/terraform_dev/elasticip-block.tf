#resource 

resource "aws_eip" "my-eip" {
  instance = aws_instance.My-ec2-instance1.id
  domain   = "vpc"
  # Meta-Argument
  depends_on = [aws_internet_gateway.my-igw]
}
