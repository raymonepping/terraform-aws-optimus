output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_id" {
  value = aws_subnet.public.id
}

output "sg_id" {
  value = aws_security_group.ssh.id
}

output "sdn_dcgw_subnet_id" {
  description = "Subnet ID for SDN-DCGW interconnect"
  value       = aws_subnet.sdn_dcgw_interconnect.id
}
