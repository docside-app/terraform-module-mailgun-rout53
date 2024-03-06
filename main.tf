resource "aws_route53_record" "mailgun_spf" {
  name    = var.mailgun_subdomain
  type    = "TXT"
  records = ["v=spf1 include:mailgun.org ~all"]
  ttl     = 3600
  zone_id = var.zone_id
}

resource "aws_route53_record" "lceeq_mailgun_mx" {
  name = var.mailgun_subdomain
  records = var.mx_records
  ttl     = 600
  type    = "MX"
  zone_id = var.zone_id
}

resource "aws_route53_record" "lceeq_mailgun_dkim" {
  name = join(".", [var.dkim_selector, "_domainkey", var.mailgun_subdomain])
  records = [
    var.dkim_key
  ]
  ttl     = 600
  type    = "TXT"
  zone_id = var.zone_id
}

resource "aws_route53_record" "lceeq_mailgun_cname" {
  name = join(".", ["email",var.mailgun_subdomain])
  records = [
    "mailgun.org"
  ]
  ttl     = 600
  type    = "CNAME"
  zone_id = var.zone_id
}
