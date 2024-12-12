locals {
  managed_compartments = merge(
    oci_identity_compartment.level1_compartments,
    oci_identity_compartment.level2_compartments,
    oci_identity_compartment.level3_compartments,
    oci_identity_compartment.level4_compartments,
    oci_identity_compartment.level5_compartments,
    oci_identity_compartment.level6_compartments
  )
}

output "managed_compartments" {
  value = local.managed_compartments
}
