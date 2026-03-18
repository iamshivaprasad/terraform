resource "aws_instance" "terraform" {
  ami = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_all.id] # reference to the security group created above
 
  tags = {
    Name = "terraform-instance"
    Terraform = "true"
  }
}

resource "aws_security_group" "allow_all" { # this is the security group that allows all traffic
  name   = "allow-all" # it should be unique within the VPC for user reference
  
  egress {
    from_port        = 0 # from port 0 to port 0 means all ports
    to_port          = 0
    protocol         = "-1" # -1 means all protocols
    cidr_blocks      = ["0.0.0.0/0"] # internet
    
  }

  ingress {
    from_port        = 0 # from port 0 to port 0 means all ports
    to_port          = 0
    protocol         = "-1" # -1 means all protocols
    cidr_blocks      = ["0.0.0.0/0"] # internet
    
  }

  tags = {
    Name = "allow-all" # it should be unique within the VPC for user reference
    Terraform = "true"
  }
}