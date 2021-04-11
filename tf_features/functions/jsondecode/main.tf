# Scenario 1
locals {
  json_data = jsondecode(file("tenant.json"))
}

provider "aws" {}

module "user_queue" {
  source = "./resources"
  name   = element(local.json_data.keyvalues[*].value, 1)
}


output "json" {
  value = lookup(element(local.json_data.inputs, 0), "tenant-pair", "what?")
}
*/

# Scenario 2
locals {
  tenant_data = jsondecode(file("tenant.json"))
}

output "json" {
  value = element(flatten([for v in local.tenant_data.inputs : v.tenant-pair]), 0)
}
