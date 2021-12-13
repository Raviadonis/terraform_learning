##########################
# Create Security Groups #
##########################

resource "openstack_networking_secgroup_v2" "secgroup_1" {
  name        = "secgroup_1"
  description = "My neutron security group"
}

#############################################
# Application Security Group Rules Creation
#############################################

module "hid_sg" {
  source        = "../../../../modules/sg/sg_rules"
  ingress_rules = var.hid_ingress_rules
  egress_rules  = var.hid_egress_rules
  ingress_sg    = local.hid_ingress_sg
  egress_sg     = local.hid_egress_sg
  sg_id         = data.openstack_networking_secgroup_v2.hid_sg.id
}


module "uxp_sg" {
  source        = "../../../../modules/sg/sg_rules"
  ingress_rules = var.uxp_ingress_rules
  egress_rules  = var.uxp_egress_rules
  ingress_sg    = local.uxp_ingress_sg
  egress_sg     = local.uxp_egress_sg
  sg_id         = data.openstack_networking_secgroup_v2.uxp_sg.id
}

module "mule_sg" {
  source        = "../../../../modules/sg/sg_rules"
  ingress_rules = var.mule_ingress_rules
  egress_rules  = var.mule_egress_rules
  ingress_sg    = local.mule_ingress_sg
  egress_sg     = local.mule_egress_sg
  sg_id         = data.openstack_networking_secgroup_v2.mule_sg.id
}

module "pb_sg" {
  source        = "../../../../modules/sg/sg_rules"
  ingress_rules = var.pb_ingress_rules
  egress_rules  = var.pb_egress_rules
  ingress_sg    = local.pb_ingress_sg
  egress_sg     = local.pb_egress_sg
  sg_id         = data.openstack_networking_secgroup_v2.pb_sg.id
}
