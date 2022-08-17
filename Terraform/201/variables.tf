variable "fabric" {
  type = string
}

variable "switches" {
  type = map(object({
    fabric = string
  }))
}

variable "vrfs" {
  type = map(object({
    vrf_name = string
    vrf_id = number
    vlan_id = number
    attach = list(string)
  }))
}

variable "networks" {
  type = map(object({
    net_name      = string
    vrf_name      = string
    net_id        = number
    vlan_id       = number
    gw_ip_subnet  = string
    attach = map(object({
      ports = list(string)
    }))
  }))
}
