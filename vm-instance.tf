module "simple-vm-example" {
  source     = "git::https://github.com/GoogleCloudPlatform/cloud-foundation-fabric.git//modules/compute-vm"
  project_id = var.service-project-id
  zone       = var.zone
  name       = var.vm_name
  network_interfaces = [{

    network    = module.vpc-host.self_link
    subnetwork = "projects/${var.project-id}/regions/${var.region}/subnetworks/${var.my_subnets[0].name}"

  }]
}
