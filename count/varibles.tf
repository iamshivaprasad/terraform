variable "instances" {
    type = list(string)
    default = [ "mongodb", "redis", "mysql", "rabbitmq" ] 
}