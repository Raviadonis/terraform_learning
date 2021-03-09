# Application Security Group Rule creation
locals {
  application_sg = {
    "HID"  = { port = "8445", source_ip = ["172.27.253.135/32", "172.27.253.128/32"] },
    "UXP"  = { port = "8443", source_ip = ["10.0.0.9/32"] },
    "MULE" = { port = "443", source_ip = ["10.0.0.10/32"] }
  }
}

module "app_sg" {
 for_each = local.application_sg
  source              = "../modules/sg"
  description         = "${each.key} Security Group"
  sg_name             = each.key
  from_port           = each.value.port
  to_port             = each.value.port
  src_ip              = each.value.source_ip
}
