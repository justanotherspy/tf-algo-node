variable "my_ip" {
  description = "My IP Address"
  type = string
}

resource "aws_instance" "instance" {
  ami             = "ami-0e93b3dda12646545"
  instance_type   = "t3.small"
  security_groups = [aws_security_group.sg.name]
  tags = {
    "Name"    = "algo-node"
    "project" = "algorand"
  }
}

resource "aws_security_group" "sg" {
  name        = "myip"
  description = "launch-wizard-1 created 2021-08-03T21:13:52.215+02:00"
  ingress = [{
    cidr_blocks      = ["${var.my_ip}"]
    description      = "my ip"
    from_port        = 22
    protocol         = "tcp"
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    to_port          = 22
    self             = false
  }]
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  tags = {
    "project" = "algorand"
    "Name"    = "algo-security-group"
  }
}