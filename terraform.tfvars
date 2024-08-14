project-id         = "saran##hg-######"
service-project-id = "bk####sh"
region             = "us-central1"
host-network       = "my-host-network"
psc_config         = [{ subnetworks = ["projects/s###nsh###/regions/us-central1/subnetworks/subnet-1"], limit = 16 }]
service_name       = "service-connection-policy"
location           = "us-central1"
service_class      = "gcp-memorystore-redis"
redis-cluster      = "redister"
cloud-router       = "airtel"
vm_name            = "redis-client"
zone               = "us-central1-a"
my_subnets = [
  {
    ip_cidr_range = "10.0.0.0/24"
    name          = "subnet-1"
    region        = "us-central1"
  }
]
