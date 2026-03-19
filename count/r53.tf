resource "aws_route53_record" "roboshop" {
count = 4
 zone_id = "${var.zone-id}"
 name = "${var.instances[count.index]}.${var.domain_name}" # mongodb.shivaprasad.fun, redis.shivaprasad.fun, mysql.shivaprasad.fun, rabbitmq.shivaprasad.fun
 type = "A"
 ttl = "1"
 records = [aws_instance.Terraform[count.index].private_ip]
 allow_overwrite = true
 }