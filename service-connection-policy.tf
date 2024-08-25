# Create a service connection policy
module "service-connection-policy" {
  source = "git::https://github.com/saransh0007/terraform-module-servicepolicy"

  psc_config    = var.psc_config
  network       = module.vpc-host[0].self_link
  location      = var.location
  service_class = var.service_class
  name          = var.service_name
  project_id    = var.host-project-id
}
