### FABRIC NAME ###
fabric = "CML-DC1"

### FABRIC INVENTORY ###
switches = {
  DC1-LEAF-1 = {
    fabric = "CML-DC1"
  }
  DC1-LEAF-2 = {
    fabric = "CML-DC1"
  }
  DC1-BGW-1 = {
    fabric = "CML-DC1"
  }
  DC1-BGW-2 = {
    fabric = "CML-DC1"
  }
}

### VRFs ###
vrfs = {
  TERRAFORM-DEMO-VRF-1 = {
    attach    = ["DC1-LEAF-1", "DC1-LEAF-2", "DC1-BGW-1", "DC1-BGW-2"]
    vlan_id   = 2201
    vrf_id    = 52201
    vrf_name  = "TERRAFORM-DEMO-VRF-1"
  }
  TERRAFORM-DEMO-VRF-2 = {
    attach    = ["DC1-LEAF-1", "DC1-LEAF-2", "DC1-BGW-1", "DC1-BGW-2"]
    vlan_id   = 2202
    vrf_id    = 52202
    vrf_name  = "TERRAFORM-DEMO-VRF-2"
  }
  TERRAFORM-DEMO-VRF-3 = {
    attach    = ["DC1-LEAF-1", "DC1-LEAF-2", "DC1-BGW-1", "DC1-BGW-2"]
    vlan_id   = 2203
    vrf_id    = 52203
    vrf_name  = "TERRAFORM-DEMO-VRF-3"
  }
}

### NETWORKS ###
networks = {
  TERRAFORM-DEMO-NET-1 = {
    attach = {
      DC1-LEAF-1 = {
        ports = ["Ethernet1/15", "Ethernet1/16"]
      }
      DC1-LEAF-2 = {
        ports = ["Ethernet1/15", "Ethernet1/16"]
      }
    }
    gw_ip_subnet  = "192.168.1.1/24"
    net_id        = 30201
    net_name      = "TERRAFORM-DEMO-NET-1"
    vlan_id       = 3201
    vrf_name      = "TERRAFORM-DEMO-VRF-1"
  }
  TERRAFORM-DEMO-NET-2 = {
    attach = {
      DC1-LEAF-1 = {
        ports = ["Ethernet1/15", "Ethernet1/16"]
      }
      DC1-LEAF-2 = {
        ports = ["Ethernet1/15", "Ethernet1/16"]
      }
    }
    gw_ip_subnet  = "192.168.2.1/24"
    net_id        = 30202
    net_name      = "TERRAFORM-DEMO-NET-2"
    vlan_id       = 3202
    vrf_name      = "TERRAFORM-DEMO-VRF-1"
  }
  TERRAFORM-DEMO-NET-3 = {
    attach = {
      DC1-LEAF-1 = {
        ports = ["Ethernet1/15", "Ethernet1/16"]
      }
      DC1-LEAF-2 = {
        ports = ["Ethernet1/15", "Ethernet1/16"]
      }
    }
    gw_ip_subnet  = "192.168.3.1/24"
    net_id        = 30203
    net_name      = "TERRAFORM-DEMO-NET-3"
    vlan_id       = 3203
    vrf_name      = "TERRAFORM-DEMO-VRF-1"
  }
  TERRAFORM-DEMO-NET-4 = {
    attach = {
      DC1-LEAF-1 = {
        ports = ["Ethernet1/15", "Ethernet1/16"]
      }
      DC1-LEAF-2 = {
        ports = ["Ethernet1/15", "Ethernet1/16"]
      }
    }
    gw_ip_subnet  = "192.168.4.1/24"
    net_id        = 30204
    net_name      = "TERRAFORM-DEMO-NET-4"
    vlan_id       = 3204
    vrf_name      = "TERRAFORM-DEMO-VRF-1"
  }
  TERRAFORM-DEMO-NET-5 = {
    attach = {
      DC1-LEAF-1 = {
        ports = ["Ethernet1/15", "Ethernet1/16"]
      }
      DC1-LEAF-2 = {
        ports = ["Ethernet1/15", "Ethernet1/16"]
      }
    }
    gw_ip_subnet  = "192.168.5.1/24"
    net_id        = 30205
    net_name      = "TERRAFORM-DEMO-NET-5"
    vlan_id       = 3205
    vrf_name      = "TERRAFORM-DEMO-VRF-1"
  }
}
