locals {

  redis_clusters = {

    for i in range(var.count-num) :
    "redis-cluster${i + 1}" => {

      name = "redis-cluster${i + 1}"
    }
  }
  vpc_exists                 = data.google_compute_network.existing_vpc != null
  subnet_exists              = data.google_compute_subnetwork.existing_subnet != null
  conditional_redis_clusters = local.vpc_exists && local.subnet_exists ? local.redis_clusters : {}
}

data "google_compute_network" "existing_vpc" {
  name    = var.host-network
  project = var.host-project-id

}

data "google_compute_subnetwork" "existing_subnet" {

  name    = var.subnets[0].name
  region  = var.region
  project = var.host-project-id

}


module "redis_cluster" {

  for_each  = local.conditional_redis_clusters
  source    = "terraform-google-modules/memorystore/google//modules/redis-cluster"
  version   = "~> 10.0"
  name      = each.value.name
  project   = var.service-project-id
  region    = var.region
  #network   = ["projects/${var.host-project-id}/global/networks/${module.vpc-host[0].name}"]
  network =   module.vpc-host[0].self_link
  node_type = "REDIS_STANDARD_SMALL"

  redis_configs = {
    maxmemory-policy = "volatile-ttl"
  }
  depends_on = [
     module.vpc-host[0].self_link
  ]
}
