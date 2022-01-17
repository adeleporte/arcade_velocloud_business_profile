terraform {
  required_providers {
    velocloud = {
      source = "adeleporte/velocloud"
    }
  }
}

provider "velocloud" {
  vco     = var.host
  token    = var.token
}

data "velocloud_profile" "arcade_profile" {
  name         = var.profile_name
}

resource "velocloud_business_policies" "arcade_bp" {

  profile = data.velocloud_profile.arcade_profile.id

  rule {
    name            = "My Arcade App"
    dip             = var.ip
    dsm             = "255.255.255.255"
    dport_low       = var.port
    dport_high      = var.port
    proto           = 6
    rxbandwidthpct  = var.bw
    txbandwidthpct  = var.bw
    serviceclass    = "transactional"
    linksteering    = "ALL"
  }

}



