variable "compartments" {

  default = {}

  type = map(object({
    description   = string
    enable_delete = optional(bool)
    defined_tags  = optional(map(string))
    freeform_tags = optional(map(string))
  }))
}

// variable mapping to local
locals {
  compartments = var.compartments
}

#
# resource creation control
#
variable "create_compartment" {
  default = true

  type = bool
}

locals {
  create_compartment = var.create_compartment
}

