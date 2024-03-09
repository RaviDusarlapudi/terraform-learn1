resource "aws_instance" "My-ec2-instance1" {
  ami               = var.ec2_ami_id
  instance_type     = var.ec2_instance_type
  availability_zone = "us-east-1a"
  #count                  = var.ec2_instance_count
  key_name               = "terradform-key"
  subnet_id              = aws_subnet.my_public-subnet1.id
  vpc_security_group_ids = [aws_security_group.vpc_security_groups.id]
  tags = {
    #Name = "web-${count.index}"
    Name = "web1"
  }

  user_data = <<-EOF
        #!/bin/bash
        sudo yum update -y
        sudo yum install -y httpd
        sudo service httpd start  
        sudo systemctl enable httpd
        #echo "<h1>Welcome to StackSimplify ! AWS Infra created using Terraform in us-east-1 Region</h1>" | sudo tee /var/www/html/index.html
        echo "<h1>Welcome to StackSimplify ! AWS Infra created using Terraform in us-east-1 Region</h1>" > /var/www/html/index.html
        EOF
}

resource "aws_instance" "My-ec2-instance2" {
  ami               = var.ec2_ami_id
  instance_type     = var.ec2_instance_type
  availability_zone = "us-east-1b"
  #count                  = var.ec2_instance_count
  key_name               = "terradform-key"
  subnet_id              = aws_subnet.my_public-subnet2.id
  vpc_security_group_ids = [aws_security_group.vpc_security_groups.id]
  tags = {
    #Name = "web-${count.index}"
    Name = "web2"
  }

  user_data = <<-EOF
        #!/bin/bash
        sudo yum update -y
        sudo yum install -y httpd
        sudo service httpd start  
        sudo systemctl enable httpd
        #echo "<h1>Welcome to StackSimplify ! AWS Infra created using Terraform in us-east-1 Region</h1>" | sudo tee /var/www/html/index.html
        echo "<h1>Welcome to StackSimplify ! AWS Infra created using Terraform in us-east-1 Region</h1>" > /var/www/html/index.html
        EOF
}

resource "aws_instance" "My-ec2-instance3" {
  ami               = var.ec2_ami_id
  instance_type     = var.ec2_instance_type
  availability_zone = "us-east-1c"
  #count                  = var.ec2_instance_count
  key_name               = "terradform-key"
  subnet_id              = aws_subnet.my_public-subnet3.id
  vpc_security_group_ids = [aws_security_group.vpc_security_groups.id]
  tags = {
    #Name = "web-${count.index}"
    Name = "web3"
  }

  user_data = <<-EOF
        #!/bin/bash
        sudo yum update -y
        sudo yum install -y httpd
        sudo service httpd start  
        sudo systemctl enable httpd
        #echo "<h1>Welcome to StackSimplify ! AWS Infra created using Terraform in us-east-1 Region</h1>" | sudo tee /var/www/html/index.html
        echo "<h1>Welcome to StackSimplify ! AWS Infra created using Terraform in us-east-1 Region</h1>" > /var/www/html/index.html
        EOF
}