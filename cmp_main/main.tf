module "terraform-oci-compartments" {
  source = "../terraform-oci-compartments"

  tenancy_id            = local.tenancy_id
  existing_compartments = local.existing_compartments
  compartments          = local.compartments
}

locals {
  tenancy_id = var.tenancy_ocid
  
  existing_compartments = [
    "/avq_automation",
    "/avq_nwdeplsvc",
    "/fake"
  ]

  compartments = {
    "/cmp_security" = {
      description   = "security resources"
      enable_delete = true
    },
    "/cmp_security/cmp_siem" = {
      description   = "siem resources"
      enable_delete = true
    }
  }
}
