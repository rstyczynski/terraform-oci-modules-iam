
#
#  create resources
#

resource "oci_identity_compartment" "level1_compartments" {
  # Rule. Module resource creation is conditional
  for_each = local.create_compartment ? local.level1_compartments : {}

  compartment_id = local.tenancy_ocid

  name = local.compartments_full[each.key].name

  description   = local.compartments_full[each.key].description
  enable_delete = local.compartments_full[each.key].enable_delete

  # freeform_tags = local.compartments_full[each.key].# freeform_tags
  # defined_tags = local.compartments_full[each.key].# defined_tags

  lifecycle {
    ignore_changes = [
      defined_tags["Oracle-Tags.CreatedBy"], defined_tags["Oracle-Tags.CreatedOn"]
    ]
  }
}

resource "oci_identity_compartment" "level2_compartments" {
  for_each = local.create_compartment ? local.level2_compartments : {}

  compartment_id = can(oci_identity_compartment.level1_compartments[local.compartments_full[each.key].parent_compartment_fqn].id) ? oci_identity_compartment.level1_compartments[local.compartments_full[each.key].parent_compartment_fqn].id : local.external_compartments[dirname(each.key)].compartments[0].id

  name = local.compartments_full[each.key].name

  description   = local.compartments_full[each.key].description
  enable_delete = local.compartments_full[each.key].enable_delete

  # freeform_tags = local.compartments_full[each.key].# freeform_tags
  # defined_tags = local.compartments_full[each.key].# defined_tags

  lifecycle {
    ignore_changes = [
      defined_tags["Oracle-Tags.CreatedBy"], defined_tags["Oracle-Tags.CreatedOn"]
    ]
  }
}

resource "oci_identity_compartment" "level3_compartments" {
  for_each = local.create_compartment ? local.level3_compartments : {}

  compartment_id = can(oci_identity_compartment.level2_compartments[local.compartments_full[each.key].parent_compartment_fqn].id) ? oci_identity_compartment.level2_compartments[local.compartments_full[each.key].parent_compartment_fqn].id : local.external_compartments[local.compartments_full[each.key]].compartments[0].id

  name = local.compartments_full[each.key].name

  description   = local.compartments_full[each.key].description
  enable_delete = local.compartments_full[each.key].enable_delete

  # freeform_tags = local.compartments_full[each.key].# freeform_tags
  # defined_tags = local.compartments_full[each.key].# defined_tags

  lifecycle {
    ignore_changes = [
      defined_tags["Oracle-Tags.CreatedBy"], defined_tags["Oracle-Tags.CreatedOn"]
    ]
  }
}

resource "oci_identity_compartment" "level4_compartments" {
  for_each = local.create_compartment ? local.level4_compartments : {}

  compartment_id = can(oci_identity_compartment.level3_compartments[local.compartments_full[each.key].parent_compartment_fqn].id) ? oci_identity_compartment.level3_compartments[local.compartments_full[each.key].parent_compartment_fqn].id : local.external_compartments[local.compartments_full[each.key]].compartments[0].id

  name = local.compartments_full[each.key].name

  description   = local.compartments_full[each.key].description
  enable_delete = local.compartments_full[each.key].enable_delete

  # freeform_tags = local.compartments_full[each.key].# freeform_tags
  # defined_tags = local.compartments_full[each.key].# defined_tags

  lifecycle {
    ignore_changes = [
      defined_tags["Oracle-Tags.CreatedBy"], defined_tags["Oracle-Tags.CreatedOn"]
    ]
  }
}

resource "oci_identity_compartment" "level5_compartments" {
  for_each = local.create_compartment ? local.level5_compartments : {}

  compartment_id = can(oci_identity_compartment.level4_compartments[local.compartments_full[each.key].parent_compartment_fqn].id) ? oci_identity_compartment.level4_compartments[local.compartments_full[each.key].parent_compartment_fqn].id : local.external_compartments[local.compartments_full[each.key]].compartments[0].id

  name = local.compartments_full[each.key].name

  description   = local.compartments_full[each.key].description
  enable_delete = local.compartments_full[each.key].enable_delete

  # freeform_tags = local.compartments_full[each.key].# freeform_tags
  # defined_tags = local.compartments_full[each.key].# defined_tags

  lifecycle {
    ignore_changes = [
      defined_tags["Oracle-Tags.CreatedBy"], defined_tags["Oracle-Tags.CreatedOn"]
    ]
  }
}

resource "oci_identity_compartment" "level6_compartments" {
  for_each = local.create_compartment ? local.level6_compartments : {}

  compartment_id = can(oci_identity_compartment.level5_compartments[local.compartments_full[each.key].parent_compartment_fqn].id) ? oci_identity_compartment.level5_compartments[local.compartments_full[each.key].parent_compartment_fqn].id : local.external_compartments[local.compartments_full[each.key]].compartments[0].id

  name = local.compartments_full[each.key].name

  description   = local.compartments_full[each.key].description
  enable_delete = local.compartments_full[each.key].enable_delete

  # freeform_tags = local.compartments_full[each.key].# freeform_tags
  # defined_tags = local.compartments_full[each.key].# defined_tags

  lifecycle {
    ignore_changes = [
      defined_tags["Oracle-Tags.CreatedBy"], defined_tags["Oracle-Tags.CreatedOn"]
    ]
  }
}
