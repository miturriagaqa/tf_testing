output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.app_server.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.app_server.public_ip
}

output "instance_name" {
  description = "name of the EC2 instance"
  value       = var.instance_name
}

output "private_ip" {
  value = aws_instance.app_server.private_ip
}

output "vpc_security_group_ids" {
  value = aws_instance.app_server.vpc_security_group_ids
}

output "availability_zone" {
  value = aws_instance.app_server.availability_zone
}

