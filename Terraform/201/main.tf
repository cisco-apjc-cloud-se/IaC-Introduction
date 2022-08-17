terraform {
  required_providers {
    dcnm = {
      source = "CiscoDevNet/dcnm"
    }
  }
}

# Configure provider with your cisco dcnm/ndfc credentials.
provider "dcnm" {
  # cisco-dcnm/ndfc user name
  username = "admin"
  # cisco-dcnm/ndfc password
  password = "123Cisco123"
  # cisco-dcnm/ndfc url
  url      = "https://10.67.29.140"
  insecure = true
  # DCNM or NDFC
  platform = "nd"
}

## Read Switch Inventory ##
data "dcnm_inventory" "switches" {
  for_each = var.switches

  fabric_name = each.value.fabric
  switch_name = each.key
}

## Build Local Dictionaries
# - serial_numbers: Switch Name -> Serial Number

locals {
  serial_numbers = {
      for switch in data.dcnm_inventory.switches :
          switch.switch_name => switch.serial_number
  }
}

output "serial_numbers" {
  value = local.serial_numbers
}


# Build New Networks #
resource "dcnm_network" "demo-network" {
  for_each = var.networks

  fabric_name     = var.fabric
  name            = each.value.net_name
  network_id      = each.value.net_id
  vrf_name        = dcnm_vrf.demo-vrf[each.value.vrf_name].name ## Forces DAG
  vlan_id         = each.value.vlan_id
  ipv4_gateway    = each.value.gw_ip_subnet

  dynamic "attachments" {
    for_each = each.value.attach
    content {
      serial_number = lookup(local.serial_numbers, upper(attachments.key))
      switch_ports  = attachments.value.ports
    }
  }
}

# Build New VRFs #
resource "dcnm_vrf" "demo-vrf" {
  for_each = var.vrfs

  fabric_name             = var.fabric
  name                    = each.value.vrf_name
  vlan_id                 = each.value.vlan_id
  segment_id              = each.value.vrf_id

  dynamic "attachments" {
    for_each = toset(each.value.attach)
    content {
      serial_number = lookup(local.serial_numbers, upper(attachments.value))
    }
  }
}
