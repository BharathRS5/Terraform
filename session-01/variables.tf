variable "ami_id" { # ami_id is variable
    type = string # here type means data types.
    default = "ami-03265a0778a880afb" # this is variable value
}

variable "instance_type" {
    #type = string --> type is not mandatory terraform can automatically recognizes 
    default = "t2.micro"  
}

variable "sg_name" {
    default = "allow-all"
  
}

variable "sg_cidr" {
    type = list # list starts with []
    default = ["0.0.0.0/0"]
}

variable "tags" {
    type = map # map start with {}
    default = {
        Name = "MongoDB Server"
        Environment = "Dev"
        terraform = "true"
        Project = "Roboshop"
        Component = "MongoDB"
    }
}