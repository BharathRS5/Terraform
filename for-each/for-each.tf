resource "aws_instance" "for-each" {
    for_each = var.instances
    ami = var.ami_id
    instance_type = each.value

    tags = {
        Name = each.key
    }
  
}


resource "aws_route53_record" "using-for_each"{
    for_each = aws_instance.for-each
    zone_id = var.zone_id
    name    = "${each.key}.${var.domain}"
    type    = "A"
    ttl     = 1
    records = [each.key == "Web" ? each.value.public_ip : each.value.private_ip]
}
  

# output "aws_instance_info" {
#   value = aws_instance.for-each
# }