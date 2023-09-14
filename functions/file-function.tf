resource "aws_key_pair" "public_key" {
  key_name   = "DevOps-Practice-Key.pub"
  public_key = file("${path.module}/DevOps-Practice-Key.pub")
}

resource "aws_instance" "creation" {
    ami = var.ami_id
    instance_type = "t2.micro"
    key_name = aws_key_pair.public_key.key_name
}