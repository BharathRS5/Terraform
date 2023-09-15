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