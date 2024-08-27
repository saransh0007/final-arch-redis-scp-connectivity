host-project-id    = "saranshg-test"
service-project-id = "bkailash"
region             = "us-central1"
host-network       = "host-network-1"
psc_config         = [{ subnetworks = ["projects/saranshg-test/regions/us-central1/subnetworks/subnetwork-1"], limit = 2 }]
service_name       = "service-connection-policy"
location           = "us-central1"
service_class      = "gcp-memorystore-redis"
redis-cluster      = "redister"
cloud-router       = "airtel"
vm_name            = "redis-client"
zone               = "us-central1-a"
vpc_create         = true
count-num          = 1
subnets = [
  {
    ip_cidr_range = "10.0.0.0/24"
    name          = "subnetwork-1"
    region        = "us-central1"
  }
]
