// -----------------------------------------------------------------------
// ------------------------------------------------------------- A Records
resource "cloudflare_record" "1domain1_A" {
  zone_id = var.cloudflare_zone
  name = "@"
  proxied = true
  type = "A"
  value = var.cloudflare_ip_primary
}

// -----------------------------------------------------------------------
// --------------------------------------------------------- CNAME Records 
resource "cloudflare_record" "www_1domain1_CNAME" {
  zone_id = var.cloudflare_zone
  name = "www"
  proxied = true
  type = "CNAME"
  value = var.cloudflare_domain
}

// -----------------------------------------------------------------------
// ------------------------------------------------------------ MX Records
resource "cloudflare_record" "1domain1_MX_0" {
  zone_id = var.cloudflare_zone
  name = "@"
  priority = 1
  proxied = false
  type = "MX"
  value = "aspmx.l.google.com"
}

resource "cloudflare_record" "1domain1_MX_1" {
  zone_id = var.cloudflare_zone
  name = "@"
  priority = 5
  proxied = false
  type = "MX"
  value = "alt1.aspmx.l.google.com"
}

resource "cloudflare_record" "1domain1_MX_2" {
  zone_id = var.cloudflare_zone
  name = "@"
  priority = 5
  proxied = false
  type = "MX"
  value = "alt2.aspmx.l.google.com"
}

resource "cloudflare_record" "1domain1_MX_3" {
  zone_id = var.cloudflare_zone
  name = "@"
  priority = 10
  proxied = false
  type = "MX"
  value = "ASPMX2.GOOGLEMAIL.COM"
}

resource "cloudflare_record" "1domain1_MX_4" {
  zone_id = var.cloudflare_zone
  name = "@"
  priority = 10
  proxied = false
  type = "MX"
  value = "ASPMX3.GOOGLEMAIL.COM"
}

// -----------------------------------------------------------------------
// --- Uncomment and edit these if you need to use them ------------------
// ----------------------------------------------------------- TXT Records
# resource "cloudflare_record" "1domain1_TXT_1" {
#   zone_id = var.cloudflare_domain
#   name = "@"
#   proxied = false
#   type = "TXT"
#   value = "v=spf1 include:spf.efwd.registrar-servers.com ~all"
# }

# resource "cloudflare_record" "1domain1_TXT_2" {
#   zone_id = var.cloudflare_domain
#   name = "@"
#   proxied = false
#   type = "TXT"
#   value = var.cloudflare_txt_google_verification
# }

