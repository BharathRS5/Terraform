resource "aws_security_group" "dynamic-block" {
  name        = "dynamic-block"
  description = "Allowing http,https and ssh"

  dynamic ingress {
    for_each = var.ingress #--> here for each provide a variable ingress
    content {
        description      = ingress.value["description"]
        from_port        = ingress.value.from_port
        to_port          = ingress.value.to_port
        protocol         = "tcp"
        cidr_blocks      = ingress.value.cidr_blocks
        }
  }
  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    }

  tags = {
    Name = "dynamic-block"
    }
}

