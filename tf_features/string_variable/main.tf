# Create simple EC2 instance
resource "aws_instance" "web" {
  ami           = var.image_id
  instance_type = var.machine_type
    tags = {
      Name = var.instance_name
  }
}
