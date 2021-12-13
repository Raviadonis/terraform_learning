# Local variables for security group rules

locals {

  hid_ingress_sg = {
    rule1 = { from = 22,   to = 22,   protocol = "tcp", sg_id = module.app_sgs.sg_id[2] }
    rule2 = { from = 8445, to = 8445, protocol = "tcp", sg_id = module.app_sgs.sg_id[0] }
    rule3 = { from = 8445, to = 8445, protocol = "tcp", sg_id = module.app_sgs.sg_id[2] }
  }

  hid_egress_sg = {
    rule1 = { from = 9081, to = 9083, protocol = "tcp", sg_id = module.app_sgs.sg_id[2] }
    rule2 = { from = 9086, to = 9086, protocol = "tcp", sg_id = module.app_sgs.sg_id[2] }
    rule3 = { from = 9090, to = 9090, protocol = "tcp", sg_id = module.app_sgs.sg_id[2] }
    rule4 = { from = 22,   to = 22,   protocol = "tcp", sg_id = module.app_sgs.sg_id[2] }
    rule5 = { from = 443,  to = 443,  protocol = "tcp", sg_id = module.app_sgs.sg_id[0] }
  }

  uxp_ingress_sg = {
    rule1 = { from = 22,   to = 22,   protocol = "tcp", sg_id = module.app_sgs.sg_id[2] }
    rule2 = { from = 8443, to = 8443, protocol = "tcp", sg_id = module.app_sgs.sg_id[2] }
    rule3 = { from = 8453, to = 8453, protocol = "tcp", sg_id = module.app_sgs.sg_id[2] }
    rule4 = { from = 8440, to = 8444, protocol = "tcp", sg_id = module.app_sgs.sg_id[1] }
    rule5 = { from = 9993, to = 9993, protocol = "tcp", sg_id = module.app_sgs.sg_id[1] }
    rule6 = { from = 9999, to = 9999, protocol = "tcp", sg_id = module.app_sgs.sg_id[1] }
  }

  uxp_egress_sg = {
    rule1 = { from = 22,   to = 22,   protocol = "tcp", sg_id = module.app_sgs.sg_id[2] }
    rule2 = { from = 9081, to = 9083, protocol = "tcp", sg_id = module.app_sgs.sg_id[2] }
    rule3 = { from = 9086, to = 9086, protocol = "tcp", sg_id = module.app_sgs.sg_id[2] }
    rule4 = { from = 9090, to = 9090, protocol = "tcp", sg_id = module.app_sgs.sg_id[2] }
    rule5 = { from = 8440, to = 8444, protocol = "tcp", sg_id = module.app_sgs.sg_id[1] }
    rule6 = { from = 9993, to = 9993, protocol = "tcp", sg_id = module.app_sgs.sg_id[1] }
    rule7 = { from = 9999, to = 9999, protocol = "tcp", sg_id = module.app_sgs.sg_id[1] }
  }

  mule_ingress_sg = {
    rule1 = { from = 5701,  to = 5701,   protocol = "tcp", sg_id = module.app_sgs.sg_id[2] }
    rule2 = { from = 9083,  to = 9084,   protocol = "tcp", sg_id = module.app_sgs.sg_id[2] }
    rule3 = { from = 54327, to = 54327,  protocol = "tcp", sg_id = module.app_sgs.sg_id[2] }
    rule4 = { from = 9086,  to = 9086,   protocol = "tcp", sg_id = module.app_sgs.sg_id[0] }
    rule5 = { from = 9090,  to = 9090,   protocol = "tcp", sg_id = module.app_sgs.sg_id[0] }
    rule6 = { from = 9082,  to = 9084,   protocol = "tcp", sg_id = module.app_sgs.sg_id[0] }
  }

  mule_egress_sg = {
    rule1 = { from = 8445, to = 8445, protocol = "tcp", sg_id = module.app_sgs.sg_id[0] }
  }

  common_ingress_sg = {
  }

  common_egress_sg = {
  }
  
  mgmt_ingress_sg = {
  }

  mgmt_egress_sg = {
  }
  
}


# Variables for applications, common and management security group

## HID security group variables
variable "hid_ingress_rules" {
  default = {
    "443" = ["10.71.0.0/16"]
  }
}

variable "hid_egress_rules" {
  default = {
    "1521" = ["172.27.225.24/32"]
    "443"  = ["172.27.42.70/32"]
  }
}


## UXP security group variables
variable "uxp_ingress_rules" {
  default = {
    "22"    = ["10.32.23.21/32"]
    "8453"  = ["172.27.42.0/24"]
    "49070" = ["10.64.103.231/32"]
    "49071" = ["10.64.103.231/32"]
  }
}

variable "uxp_egress_rules" {
  default = {
    "22"    = ["10.32.23.21/32"]
    "49070" = ["10.64.103.231/32"]
    "49071" = ["10.64.103.231/32"]
  }
}

## Mule security group variables
variable "mule_ingress_rules" {
  default = {
    "22"    = ["192.168.170.140/32"]
    "49070" = ["10.64.0.0/16"]
    "49071" = ["10.64.0.0/16"]
  }
}

variable "mule_egress_rules" {
  default = {
    "22"    = ["192.168.170.140/32"]
    "443"   = ["192.168.170.140/32"]
    "49070" = ["10.64.203.131/32", "10.64.103.231/32"]
    "49071" = ["10.64.203.131/32", "10.64.103.231/32"]
  }
}
