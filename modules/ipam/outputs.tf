output "ipam_pool_id" {
  value = aws_vpc_ipam_pool.public.id
}

output "ipam_cidr_block" {
  value = aws_vpc_ipam_pool_cidr.public_range.cidr
}

output "ipam_scope_id" {
  description = "The ID of the IPAM scope"
  value       = aws_vpc_ipam.main.private_default_scope_id
}
