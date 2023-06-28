output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.app_server.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.app_server.public_ip
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

output "app_server_key_name" {
  value     = aws_instance.app_server.key_name
}

output "app_server_ami_id" {
  value     = aws_instance.app_server.ami
}

output "instance_name" {
  value     = aws_instance.app_server.tags.Name
}

output "app_server_instance_type" {
  value     = aws_instance.app_server.instance_type
}


# Output hardcoded values
output "message" {
  value = "Hello, US FRAMEWORK TEAM!"
}

output "number" {
  value = 42
}

output "list" {
  value = ["apple", "banana", "cherry"]
}

output "map" {
  value = {
  "AWS_ACCESS_KEY_ID": "{{environment.resource_handler.serviceaccount}}",
  "AWS_SECRET_ACCESS_KEY": "{{environment.resource_handler.servicepasswd}}"
  }
}
