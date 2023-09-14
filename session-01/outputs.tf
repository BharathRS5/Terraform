output "public_ip" {
    value = aws_instance.creating-ec2-instance.public_ip # resourcetype.resourcename.attribute-variable
}

output "tags_all" {
    value = aws_instance.creating-ec2-instance.tags_all
}