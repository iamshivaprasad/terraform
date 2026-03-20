resource "aws_route53_record" "roboshop" {
 for_each = aws_instance.Terraform
 zone_id = "${var.zone-id}"
 name = "${each.key}.${var.domain_name}" # mongodb.shivaprasad.fun, redis.shivaprasad.fun, mysql.shivaprasad.fun, rabbitmq.shivaprasad.fun
 type = "A"
 ttl = "1"
 records = [each.value.private_ip]
 allow_overwrite = true
 }

#  resource "aws_route53_record" "frontend" {
#  count = 1
#  zone_id = "${var.zone-id}"
#  name = "${var.instances[count.index]}.${var.domain_name}" # frontend.shivaprasad.fun
#  type = "A"
#  ttl = "1"
#  records = [aws_instance.Terraform[count.index].public_ip]
#  allow_overwrite = true
#  }