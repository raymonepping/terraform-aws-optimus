terraform {
  required_providers {
    netbox = {
      source  = "PlatformIpq/netbox"
      version = "~> 3.10.0"
    }
  }
}

provider "netbox" {
  server_url = var.netbox_url
  api_token  = var.netbox_token
}

data "netbox_vlan" "demo_vlan" {
  name = "demo-VLAN"
}

data "netbox_asn" "all" {
  tag = "demo-asn"
}

data "netbox_asn" "specific" {
  asn = var.asn_number
}

data "netbox_prefix" "secondary_pool" {
  prefix = "10.100.50.0/24"
}

resource "netbox_available_ip_address" "secondary_vm_ip" {
  count       = 3
  prefix_id   = data.netbox_prefix.secondary_pool.id
  description = "Secondary demo IP for VM ${count.index + 1}"
  tags        = ["demo-ipam"]
}

output "demo_secondary_ips" {
  description = "Secondary IPs allocated in NetBox (with VLAN via prefix)"
  value = [
    for ip in netbox_available_ip_address.secondary_vm_ip : ip.ip_address
  ]
}
