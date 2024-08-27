locals {

  redis_clusters = {

    for i in range(var.count-num) :
    "redis-cluster${i + 1}" => {

      name = "redis-cluster${i + 1}"
    }

  }
}



module "redis_cluster" {

  for_each  = local.redis_clusters
  source    = "terraform-google-modules/memorystore/google//modules/redis-cluster"
  version   = "~> 10.0"
  name      = each.value.name
  project   = var.service-project-id
  region    = var.region
  network   = ["projects/${var.host-project-id}/global/networks/${module.vpc-host[0].name}"]
  node_type = "REDIS_STANDARD_SMALL"

  redis_configs = {
    maxmemory-policy = "volatile-ttl"
  }

  depends_on = [module.vpc-host]
}

