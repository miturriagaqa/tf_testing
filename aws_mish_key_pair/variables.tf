variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "mishawsterraform"
}

variable "sec_groups" {
  description = "Name of the security group"
  type        = string
  default     = "ssh-enabled-group"
}
