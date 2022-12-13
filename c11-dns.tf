
# resource "aws_route53_record" "Edf_record" {
#   zone_id = data.aws_route53_zone.mydomain.id
#   name = "app1.myappstore.tech"
#   type = "A"

#   alias {
#     zone_id = aws_lb.my-alb.zone_id
#     name = aws_lb.my-alb.dns_name
#     evaluate_target_health = true
    
#   }
# }

resource "aws_route53_record" "NewRecord" {
  
  zone_id = data.aws_route53_zone.mydomain.id

  name = "app1.myappstore.tech"

  type = "A"

  alias {
    zone_id = aws_lb.Edf-alb.zone_id
    name = aws_lb.Edf-alb.dns_name
    evaluate_target_health = true
  }
}