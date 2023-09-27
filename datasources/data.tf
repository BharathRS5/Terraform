data "aws_ami" "to-get-ami-id" {
    most_recent = true #--> to get the most recent ami-id
    owners = ["amazon"] # --> or we can give amazon account id

    filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*.0-x86_64-gp2"]
  }
  
}

output "ami_id" {
    value = data.aws_ami.to-get-ami-id.id
}

data "aws_vpc" "to-get-details-of-default-vpc" {
  default = true
}

output "vpc_info" {
  value = data.aws_vpc.to-get-details-of-default-vpc
}

resource "aws_security_group" "allow-all" {
    name = "allow"
    vpc_id = data.aws_vpc.to-get-details-of-default-vpc.id
    description = "allowing all ports"

    ingress {
        description      = "allowing all inbound traffic"
        from_port        = 0
        to_port          = 0
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        
    }

     egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1" # -1 means all protocols
        cidr_blocks      = ["0.0.0.0/0"]
        
    }
  
}