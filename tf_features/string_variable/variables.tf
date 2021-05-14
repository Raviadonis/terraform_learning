# String variables

variable "image_id" {
  type        = string
  description = "AMI ID to launch a new EC2 instance."
  default     = "ami-096fda3c22c1c990a"    # Replace with the valid AMI ID
}

variable "machine_type" {
  type        = string
  description = "Instance type to launch a server."
  default = "t2.small"
}

variable "instance_name" {
  type        = string
  description = "Name of an EC2 instance"
  default = "Learning"
}
