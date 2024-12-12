locals {
  tenancy_ocid          = var.tenancy_id
  existing_compartments = var.existing_compartments

  l1_compartments_unique = flatten(distinct([
    for path in local.existing_compartments : [
      join("/", slice(split("/", path), 0, 2))
    ] if length(split("/", path)) > 1 && path != "/" # Note: tenancy is not added to L1 compartments, as it'a L0
  ]))

  l1_compartments_dirname = { for idx, path in local.l1_compartments_unique : path =>
    {
      dirname      = "/"
      dirname_ocid = local.tenancy_ocid
      name         = split("/", path)[1]
    }
  }

  l2_compartments_unique = flatten(distinct([
    for path in local.existing_compartments : [
      join("/", slice(split("/", path), 0, 3))
    ] if length(split("/", path)) > 2
  ]))

  l2_compartments_dirname = { for idx, path in local.l2_compartments_unique : path =>
    {
      dirname      = join("/", slice(split("/", path), 0, 2))
      dirname_ocid = data.oci_identity_compartments.level1_of[join("/", slice(split("/", path), 0, 2))].compartments[0].id
      name         = split("/", path)[2]
    }
  }

  l3_compartments_unique = flatten(distinct([
    for path in local.existing_compartments : [
      join("/", slice(split("/", path), 0, 4))
    ] if length(split("/", path)) > 3
  ]))

  l3_compartments_dirname = { for idx, path in local.l3_compartments_unique : path =>
    {
      dirname      = join("/", slice(split("/", path), 0, 3))
      dirname_ocid = data.oci_identity_compartments.level2_of[join("/", slice(split("/", path), 0, 3))].compartments[0].id
      name         = split("/", path)[3]
    }
  }

  l4_compartments_unique = flatten(distinct([
    for path in local.existing_compartments : [
      join("/", slice(split("/", path), 0, 5))
    ] if length(split("/", path)) > 4
  ]))

  l4_compartments_dirname = { for idx, path in local.l4_compartments_unique : path =>
    {
      dirname      = join("/", slice(split("/", path), 0, 4))
      dirname_ocid = data.oci_identity_compartments.level3_of[join("/", slice(split("/", path), 0, 4))].compartments[0].id
      name         = split("/", path)[4]
    }
  }

  l5_compartments_unique = flatten(distinct([
    for path in local.existing_compartments : [
      join("/", slice(split("/", path), 0, 6))
    ] if length(split("/", path)) > 5
  ]))

  l5_compartments_dirname = { for idx, path in local.l5_compartments_unique : path =>
    {
      dirname      = join("/", slice(split("/", path), 0, 5))
      dirname_ocid = data.oci_identity_compartments.level4_of[join("/", slice(split("/", path), 0, 5))].compartments[0].id
      name         = split("/", path)[5]
    }
  }

  l6_compartments_unique = flatten(distinct([
    for path in local.existing_compartments : [
      join("/", slice(split("/", path), 0, 7))
    ] if length(split("/", path)) > 6
  ]))

  l6_compartments_dirname = { for idx, path in local.l6_compartments_unique : path =>
    {
      dirname      = join("/", slice(split("/", path), 0, 6))
      dirname_ocid = data.oci_identity_compartments.level5_of[join("/", slice(split("/", path), 0, 6))].compartments[0].id
      name         = split("/", path)[6]
    }
  }
}
