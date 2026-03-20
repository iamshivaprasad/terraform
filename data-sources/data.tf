data "aws_ami" "joindevops" {
    owners = ["973714476881"]
    most_recent = true

    filter {
        name = "name"
        values = ["Redhat-9-DevOps-Practice"]

    }
    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }
    
    filter {
        name = "root-device-type"
        values = ["ebs"]
        
    }

  
}

# to get the details of the instance created manually we can use data source and we can reference the instance id to get the details of the instance and we can output the details of the instance in output.tf file
data aws_instance "mongodb" {
  instance_id = instance_id
}

output "mongodb_info" {
  value = data.aws_instance.mongodb.public_ip
}