# List variables

variable "image_id" {
  type        = string
  description = "AMI ID to launch a new EC2 instance."
  default     = "ami-096fda3c22c1c990a"    # Replace with the valid AMI ID
}

variable "machine_type" {
  type        = list(string)
  description = "Instance type to launch a server."
  default = ["t2.small", "t2.medium"]
}

variable "instance_name" {
  type        = list(string)
  description = "Name of an EC2 instance"
  default = ["Web", "App"]
}
