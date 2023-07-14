variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "mishawsterraform"
}

variable "sec_groups" {
  description = "Security Group"
  type        = string
  default     = ""
}
