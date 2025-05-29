output "all_asn_raw" {
  value = data.netbox_asn.all
}

output "netbox_url" {
  description = "NetBox server URL"
  value       = var.netbox_url
}

output "demo_vlan_id" {
  description = "The VLAN ID fetched from NetBox"
  value       = data.netbox_vlan.demo_vlan.vid
}

output "demo_vlan_name" {
  description = "The VLAN name"
  value       = data.netbox_vlan.demo_vlan.name
}
