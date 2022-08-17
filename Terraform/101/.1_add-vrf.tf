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
