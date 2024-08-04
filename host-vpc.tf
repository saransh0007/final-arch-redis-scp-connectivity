module "vpc-host" {
  source          = "git::https://github.com/GoogleCloudPlatform/cloud-foundation-fabric.git//modules/net-vpc"
  project_id      = var.project-id
  name            = var.host-network
  subnets         = var.my_subnets
  shared_vpc_host = true
  shared_vpc_service_projects = [
    #module.service-project.self_link
    var.service-project-id
  ]

}






