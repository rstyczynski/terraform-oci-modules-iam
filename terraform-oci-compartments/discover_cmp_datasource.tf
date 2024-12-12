
data "oci_identity_compartments" "level1_of" {
  for_each = tomap({ for idx, data in local.l1_compartments_dirname : "/${data.name}" => idx })

  compartment_id = local.tenancy_ocid
  access_level   = "ANY"
  state          = "ACTIVE"

  name = split("/", each.key)[1]
}

data "oci_identity_compartments" "level2_of" {
  for_each = { for idx, data in local.l2_compartments_dirname : "${data.dirname}/${data.name}" => data }

  compartment_id = each.value.dirname_ocid
  access_level   = "ANY"
  state          = "ACTIVE"

  name = each.value.name
}

data "oci_identity_compartments" "level3_of" {
  for_each = { for idx, data in local.l3_compartments_dirname : "${data.dirname}/${data.name}" => data }

  compartment_id = each.value.dirname_ocid
  access_level   = "ANY"
  state          = "ACTIVE"

  name = each.value.name
}

data "oci_identity_compartments" "level4_of" {
  for_each = { for idx, data in local.l4_compartments_dirname : "${data.dirname}/${data.name}" => data }

  compartment_id = each.value.dirname_ocid
  access_level   = "ANY"
  state          = "ACTIVE"

  name = each.value.name
}

data "oci_identity_compartments" "level5_of" {
  for_each = { for idx, data in local.l5_compartments_dirname : "${data.dirname}/${data.name}" => data }

  compartment_id = each.value.dirname_ocid
  access_level   = "ANY"
  state          = "ACTIVE"

  name = each.value.name
}

data "oci_identity_compartments" "level6_of" {
  for_each = { for idx, data in local.l6_compartments_dirname : "${data.dirname}/${data.name}" => data }

  compartment_id = each.value.dirname_ocid
  access_level   = "ANY"
  state          = "ACTIVE"

  name = each.value.name
}
