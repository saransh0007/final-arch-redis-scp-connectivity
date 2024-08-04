module "redis_cluster" {
  source  = "terraform-google-modules/memorystore/google//modules/redis-cluster"
  version = "~> 10.0"

  name      = var.redis-cluster
  project   = var.service-project-id
  region    = var.region
  network   = ["projects/${var.project-id}/global/networks/${var.host-network}"]
  node_type = "REDIS_STANDARD_SMALL"

  redis_configs = {
    maxmemory-policy = "volatile-ttl"
  }

}