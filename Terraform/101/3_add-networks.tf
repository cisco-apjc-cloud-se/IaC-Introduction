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

# Add New VRF #
resource "dcnm_vrf" "demo-vrf-1" {
  fabric_name = "CML-DC1"
  name        = "TERRAFORM-VRF-1"
  deploy      = true
  vlan_id     = 2201
  segment_id  = 52201
  attachments {
    serial_number = "90H5W089HOR" # DC1-LEAF-1
  }
  attachments {
    serial_number = "9DYEHJ6N21Z" # DC1-LEAF-2
  }
  attachments {
    serial_number = "96WZGN1HLSR" # DC1-BGW-1
  }
  attachments {
    serial_number = "9KBKJJ9TCG7" # DC1-BGW-2
  }
}

# # Add 2nd VRF #
# resource "dcnm_vrf" "demo-vrf-2" {
#   fabric_name = "CML-DC1"
#   name        = "TERRAFORM-VRF-2"
#   deploy      = true
#   vlan_id     = 2202
#   segment_id  = 52202
#   attachments {
#     serial_number = "90H5W089HOR" # DC1-LEAF-1
#   }
#   attachments {
#     serial_number = "9DYEHJ6N21Z" # DC1-LEAF-2
#   }
#   attachments {
#     serial_number = "96WZGN1HLSR" # DC1-BGW-1
#   }
#   attachments {
#     serial_number = "9KBKJJ9TCG7" # DC1-BGW-2
#   }
# }

# Add 1st Network #
resource "dcnm_network" "demo-net-1" {
  fabric_name     = "CML-DC1"
  name            = "TERRAFORM-NET-1"
  network_id      = 30201
  vrf_name        = dcnm_vrf.demo-vrf-1.name ## Forces DAG == "TERRAFORM-VRF-1"
  vlan_id         = 3201
  ipv4_gateway    = "192.168.21.1/24"
  deploy = true
  attachments {
    serial_number = "90H5W089HOR" # DC1-LEAF-1
    switch_ports = ["Ethernet1/15", "Ethernet1/16"]
  }
  attachments {
    serial_number = "9DYEHJ6N21Z" # DC1-LEAF-2
    switch_ports = ["Ethernet1/15", "Ethernet1/16"]
  }
}

# Add 2nd Network #
resource "dcnm_network" "demo-net-2" {
  fabric_name     = "CML-DC1"
  name            = "TERRAFORM-NET-2"
  network_id      = 30202
  vrf_name        = dcnm_vrf.demo-vrf-1.name ## Forces DAG == "TERRAFORM-VRF-1"
  vlan_id         = 3202
  ipv4_gateway    = "192.168.22.1/24"
  deploy = true
  attachments {
    serial_number = "90H5W089HOR" # DC1-LEAF-1
    switch_ports = ["Ethernet1/15", "Ethernet1/16"]
  }
  attachments {
    serial_number = "9DYEHJ6N21Z" # DC1-LEAF-2
    switch_ports = ["Ethernet1/15", "Ethernet1/16"]
  }
}
