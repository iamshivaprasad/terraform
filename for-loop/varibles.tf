variable "instances" {
    default = [ "mongodb", "redis", "mysql", "rabbitmq" , "catalogue" , "cart", "payment", "shipping", "frontend", "user" ]
}

variable "instances" {
    default = {
        mongodb = {
            instance_type = "t3.micro"
            ami = "ami-id"
        }
    }
}

variable "zone-id" {
    default = "Z0903255Q9K7X8L2H6G"
  
}

variable "domain_name" {
    default = "shivaprasad.fun"
  
}