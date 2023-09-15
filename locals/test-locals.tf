# resource "aws_instance" "count" {
#     count = 10
#     ami = local.ami_id
#     instance_type = var.instance_names[count.index] == "MongoDB" || var.instance_names[count.index] == "MySQL" || var.instance_names[count.index] == "RabbitMQ" ? "t3.medium" : "t2.micro" 

#     tags = {
#       Name = var.instance_names[count.index]
#     }
# }

# resource "aws_route53_record" "record" {
#   count = 10
#   zone_id = var.zone_id
#   name    = "${var.instance_names[count.index]}.${var.domain}" 
#   type = "A"
#   ttl     = 1
#   records = [aws_instance.count[count.index].private_ip]
# }

resource "aws_key_pair" "public_key" {
  key_name   = "DevOps-Practice-Key.pub"
  public_key = local.key_path
}

resource "aws_instance" "creation" {
    ami = local.ami_id
    instance_type = local.instance_type
    key_name = aws_key_pair.public_key.key_name
}