# Configure the Cloudflare provider
provider "cloudflare" {
  email = "${var.cloudflare_email}"
  token = "${var.cloudflare_apikey}"
}

resource "cloudflare_zone" "1domain1" {
    zone = "${var.cloudflare_domain}"
}
