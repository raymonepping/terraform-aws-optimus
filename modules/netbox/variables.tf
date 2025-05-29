variable "netbox_url" {
  description = "NetBox server URL"
  type        = string
}
variable "netbox_token" {
  description = "NetBox API token"
  type        = string
}
variable "asn_number" {
  description = "ASN to fetch (optional)"
  type        = number
  default     = null
}
