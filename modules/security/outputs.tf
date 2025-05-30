output "ssh_security_group_id" {
  description = "The ID of the SSH security group"
  value       = aws_security_group.ssh.id
}
