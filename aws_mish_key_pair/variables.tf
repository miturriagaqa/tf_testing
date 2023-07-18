variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "mishawsterraform"
}

variable "AWS_ACCESS_KEY_ID" {
  description = "Value of the Access key for AWS"
  type        = string
}

variable "AWS_SECRET_ACCESS_KEY" {
  description = "Value of the Secret Key for AWS"
  type        = string
}
