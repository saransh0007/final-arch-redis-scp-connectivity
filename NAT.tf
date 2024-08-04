module "cloud_router" {
  source  = "terraform-google-modules/cloud-router/google"
  version = "~> 6.0"
  name    = var.cloud-router
  project = var.project-id
  network = var.host-network
  region  = var.region

  nats = [{
    name                               = "my-nat-gateway"
    source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
    subnetworks = [
      {
        name                    = "projects/${var.project-id}/regions/${var.region}/subnetworks/${var.my_subnets[0].name}"
        source_ip_ranges_to_nat = ["PRIMARY_IP_RANGE"]
        #secondary_ip_range_names = module.vpc.subnets["us-central1/production"].secondary_ip_range[*].range_name
      }
    ]
  }]
}
