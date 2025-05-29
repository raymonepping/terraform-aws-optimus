output "public_ips" {
  value = [for instance in aws_instance.vm : instance.public_ip]
}

output "instance_ids" {
  value = [for instance in aws_instance.vm : instance.id]
}

output "instance_tags" {
  value = [for vm in aws_instance.vm : vm.tags]
}

