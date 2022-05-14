resource "scaleway_domain_zone" "wttj" {
  domain    = var.dns
  subdomain = "wttj"
}

resource "scaleway_domain_record" "wilcard_lb_record" {
  dns_zone = "${scaleway_domain_zone.wttj.subdomain}.${scaleway_domain_zone.wttj.domain}"
  name     = "*"
  type     = "A"
  data     = scaleway_lb_ip.reserved_lb_ip.ip_address
  ttl      = 300
}
