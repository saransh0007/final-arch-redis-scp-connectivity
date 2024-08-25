module "vpc-host" {
  count  = var.host-project-id != var.service-project-id ? 1 : 0
  source = "git::https://github.com/GoogleCloudPlatform/cloud-foundation-fabric.git//modules/net-vpc"

  project_id      = var.host-project-id
  name            = var.host-network
  subnets         = var.subnets
  shared_vpc_host = true
  shared_vpc_service_projects = [

    var.service-project-id

  ]

}



