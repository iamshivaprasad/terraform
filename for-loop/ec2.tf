resource "aws_instance" "Terraform" {
    # count = 4
    #count = length(var.instances)
    for_each = toset(var.instances) # toset will convert list to set and set will remove duplicates if any
    ami = "ami-0220d79f3f480ecf5"
    instance_type = "each.value"
    vpc_security_group_ids = [aws_security_group.allow_all.id]
    tags = {
        Name = "each.value"
        Terraform = "true"
    }
}

resource "aws_security_group" "allow_all" {
  name   = "allow-all"

  egress {
    from_port        = 0 # from port 0 to to port 0 means all ports
    to_port          = 0 
    protocol         = "-1" # -1 means all protocols
    cidr_blocks      = ["0.0.0.0/0"] # internet
  }

  ingress {
    from_port        = 0 # from port 0 to to port 0 means all ports
    to_port          = 0 
    protocol         = "-1" # -1 means all protocols
    cidr_blocks      = ["0.0.0.0/0"] # internet
  }

  tags = {
    Name = "allow-all"
  }

}