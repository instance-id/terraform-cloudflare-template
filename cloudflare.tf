# Configure the Cloudflare provider
provider "cloudflare" {
  version = "~> 2.0"
  email   = var.cloudflare_email
  api_key = var.cloudflare_api_key
}

resource "cloudflare_zone" "1domain1" {
  paused = false
  plan   = "free"
  type   = "full"
  zone   = var.cloudflare_domain
}
