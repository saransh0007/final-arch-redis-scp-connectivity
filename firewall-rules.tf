module "firewall_rules" {
  source       = "terraform-google-modules/network/google//modules/firewall-rules"
  version      = "9.1.0"
  project_id   = var.host-project-id
  network_name = module.vpc-host[0].name

  ingress_rules = [{
    name        = "allow-ssh-ingress-shared"
    description = null
    direction   = "INGRESS"
    priority    = null

    source_ranges = ["10.88.0.0/16", "35.235.240.0/20"]

    allow = [{
      protocol = "tcp"
      ports    = ["22"]
    }]
    deny = []
    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
    },
    {
      name          = "allow-memorystore-connect"
      description   = null
      direction     = "INGRESS"
      priority      = null
      source_ranges = ["10.0.0.0/24"]

      allow = [{
        protocol = "tcp"
        ports    = ["6379"]
      }]
      deny = []
      log_config = {
        metadata = "INCLUDE_ALL_METADATA"
      }
    }

  ]
}