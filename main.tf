resource "aws_instance" "ec2" {
  ami                    = "ami-0e58b56aa4d64231b"  # Update with valid AMI if needed
  instance_type          = "t2.micro"
  key_name               = "jill1"
  vpc_security_group_ids = [aws_security_group.sg.id]

 user_data =  <<-EOF
   #!/bin/bash
   sudo yum update -y
   sudo yum install -y httpd
   sudo systemctl start httpd
   sudo systemctl enable httpd
   echo "Welcome browser" > /var/www/html/index.html
 EOF

  tags = {
    Name = "MyEC2Instance"
  }
}



resource "aws_security_group" "sg" {
  name        = "Only allow ssh and http"
  description = "create the sg"
  dynamic "ingress" {
    for_each = var.sg_port
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Digi_Network"
  }
}
