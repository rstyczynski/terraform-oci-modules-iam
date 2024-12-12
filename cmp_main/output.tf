output external_compartments {
    value = module.terraform-oci-compartments.external_compartments
}

output managed_compartments {
    value = module.terraform-oci-compartments.managed_compartments
}

output compartments {
    value = module.terraform-oci-compartments.compartments
}
