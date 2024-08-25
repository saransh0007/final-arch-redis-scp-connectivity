locals {
  cloud-router-count = {

    for i in range(var.count-num) :
    "cloud-router${i + 1}" => {

      name = "cloud-router${i + 1}"
    }

  }

}

module "cloud_router" {
  for_each = local.cloud-router-count
  source   = "terraform-google-modules/cloud-router/google"
  version  = "~> 6.0"
  name     = each.key
  project  = var.host-project-id
  network  = module.vpc-host[0].name
  region   = var.region

  nats = [{
    name                               = "my-nat-gateway"
    source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
    subnetworks = [
      {
        name                    = "projects/${var.host-project-id}/regions/${var.region}/subnetworks/${var.subnets[0].name}"
        source_ip_ranges_to_nat = ["PRIMARY_IP_RANGE"]

      }
    ]
  }]
}
