###########################################
# Create application security group rules #
###########################################

resource "openstack_networking_secgroup_v2" "ingress_cidr" {
  for_each          = var.ingress_rules != "" ? var.ingress_rules : {}
  direction         = "ingress"
  ethertype         = "IPv4"
  port_range_min    = each.key
  port_range_max    = each.key
  protocol          = "tcp"
  security_group_id = var.sg_id
  remote_prefix_ip  = each.value

  lifecycle {
    create_before_destroy = true
  }
}

resource "openstack_networking_secgroup_v2" "egress_cidr" {
  for_each          = var.egress_rules != "" ? var.egress_rules : {}
  direction         = "egress"
  ethertype         = "IPv4"
  port_range_min    = each.key
  port_range_max    = each.key
  protocol          = "tcp"
  security_group_id = var.sg_id
  remote_prefix_ip  = each.value

  lifecycle {
    create_before_destroy = true
  }
}

resource "openstack_networking_secgroup_v2" "ingress_sg" {
  for_each                 = var.ingress_sg != "" ? var.ingress_sg : {}
  direction                = "ingress"
  ethertype                = "IPv4"
  port_range_min           = each.value.port_range_min
  port_range_max           = each.value.port_range_max
  protocol                 = each.value.protocol
  security_group_id        = var.sg_id
  remote_group_id          = each.value.sg_id

  lifecycle {
    create_before_destroy = true
  }
}

resource "openstack_networking_secgroup_v2" "egress_sg" {
  for_each                 = var.egress_sg != "" ? var.egress_sg : {}
  direction                = "egress"
  ethertype                = "IPv4"
  port_range_min           = each.value.port_range_min
  port_range_max           = each.value.port_range_max
  protocol                 = each.value.protocol
  security_group_id        = var.sg_id
  remote_group_id          = each.value.sg_id

  lifecycle {
    create_before_destroy = true
  }
}
