variable "instances" {
    type = list(string)
    default = [ "mongodb", "redis", "mysql", "rabbitmq" ] 
}

variable "zone-id" {
    default = "Z0903255Q9K7X8L2H6G"
  
}

variable "domain_name" {
    default = "shivaprasad.fun"
  
}