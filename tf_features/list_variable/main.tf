# Create two simple EC2 instance
resource "aws_instance" "web" {
  ami           = var.image_id
  instance_type = var.machine_type[0]
    tags = {
      Name = var.instance_name
  }
}

resource "aws_instance" "app" {
  ami           = var.image_id
  instance_type = var.machine_type[1]
    tags = {
      Name = var.instance_name
  }
}
