
data "google_compute_network" "existing_vpc" {
  count   = var.vpc_create ? 0 : 1
  name    = var.host-network
  project = var.host-project-id

}

data "google_compute_subnetwork" "existing_subnet" {
  count   = var.vpc_create ? 0 : 1
  name    = var.subnets[0].name
  region  = var.region
  project = var.host-project-id

}

module "vpc-host" {
  count  = (var.host-project-id != var.service-project-id && var.vpc_create) ? 1 : 0
  source = "git::https://github.com/GoogleCloudPlatform/cloud-foundation-fabric.git//modules/net-vpc"

  project_id      = var.host-project-id
  name            = var.host-network
  subnets         = var.subnets
  shared_vpc_host = true
  shared_vpc_service_projects = [

    var.service-project-id

  ]

}



