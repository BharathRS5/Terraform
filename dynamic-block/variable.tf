variable "ingress" {
    type = list
    default = [
        {
            from_port = 80
            to_port = 80
            description = "allowing port 80 from public"
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        },
        {
            from_port = 443
            to_port = 443
            description = "allowing port 443 from public"
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        },
        {
            from_port = 22
            to_port = 22
            description = "allowing port 22 from public"
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    ]

  
}