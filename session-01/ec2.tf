# resource "aws_instance" "creating-ec2-instance" {
#     ami = "ami-03265a0778a880afb"
#     instance_type =  
# }

resource "aws_instance" "creating-ec2-instance" { # "resourcetype" and "resource-name(ourwish)"
    ami = var.ami_id # var.variable-name this is how we refer a variable when required.
    instance_type = var.instance_type
    security_groups = [aws_security_group.allow-all.name] # i am having a sg file how to get it here --> resource type.name-of-your-resource.name

    # tags = {
    #     Name = "MongoDB Server"
    #     Environment = "Dev"
    #     terraform = "true"
    #     Project = "Roboshop"
    #     Component = "MongoDB"
    # }

    tags = var.tags
}