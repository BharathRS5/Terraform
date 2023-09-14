resource "aws_instance" "count" {
    count = 10
    ami = var.ami_id
    instance_type = var.instance_names[count.index] == "MongoDB" || var.instance_names[count.index] == "MySQL" || var.instance_names[count.index] == "RabbitMQ" ? "t3.medium" : "t2.micro" # here || means "or"

    tags = {
      Name = var.instance_names[count.index]
    }
}

resource "aws_route53_record" "record" {
  count = 10
  zone_id = var.zone_id
  name    = "${var.instance_names[count.index]}.${var.domain}" # --> when we are mixing the variable and the string the variable should be mentioned in ${} ---> this is called as interpolation.
  type    = "A"
  ttl     = 1
  records = [aws_instance.count[count.index].private_ip]
}