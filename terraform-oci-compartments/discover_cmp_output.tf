
locals {
  external_compartments_envelope = merge(
    data.oci_identity_compartments.level1_of,
    data.oci_identity_compartments.level2_of,
    data.oci_identity_compartments.level3_of,
    data.oci_identity_compartments.level4_of,
    data.oci_identity_compartments.level5_of,
    data.oci_identity_compartments.level6_of
  )

  external_compartments = {
    for key, value in local.external_compartments_envelope : key => value.compartments[0]
  }
}

output "external_compartments" {
  value = local.external_compartments
}


