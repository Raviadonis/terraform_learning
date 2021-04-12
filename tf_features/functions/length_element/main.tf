# Fetch VPC ID
data "aws_vpcs" "foo" {
  filter {
    name   = "tag:type"
    values = ["default"]
  }
}

# Create a security groups
resource "aws_security_group" "app_sg" {
  count        = length(var.sg_name)
  name         = element(var.sg_name, count.index)
  vpc_id       = element(flatten(data.aws_vpcs.foo.ids), 0)
  description  = "My VPC Security Group"
  tags = {
    Name = element(var.sg_name, count.index)
    Description = "My VPC Security Group"
  }
}


variable "sg_name" {
  default = ["APP1", "APP2", "APP3", "APP4", "APP5"]
}
