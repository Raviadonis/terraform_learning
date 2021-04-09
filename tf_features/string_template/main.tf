############################
# Create WEB & APP servers #
############################

resource "aws_instance" "web" {
  count         = 1
  ami           = "ami-038f1ca1bd58a5790"  #Replace with valid AMI ID
  instance_type = "t2.small"
}

resource "aws_instance" "app" {
  count         = 1
  ami           = "ami-038f1ca1bd58a5790"  #Replace with valid AMI ID
  instance_type = "t2.medium"
}


###############################
# Display the content of file #
###############################

resource "null_resource" "sample" {
  depends_on = [local_file.ansible_inventory] 
 
  provisioner "local-exec" {
    command = "cat inventory/hosts"
  }
}

#####################################################
# Create Ansible Inventory using TF string template #
#####################################################

resource "local_file" "ansible_inventory" {
  filename        = "inventory/hosts"
  file_permission = "664"
  content         = <<-EOT
[web_server]
%{for ip in aws_instance.web.*.private_ip~}
${ip}
%{endfor~}

[app_server]
%{for ip in aws_instance.app.*.private_ip~}
${ip}
%{endfor~}
EOT
}
