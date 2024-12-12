output "compartments" {
  value = merge(
    local.managed_compartments,
    local.external_compartments
  )
}

