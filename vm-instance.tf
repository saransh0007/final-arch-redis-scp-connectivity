locals {
  vm_instances = {
    for i in range(var.count-num) :
    "vm${i + 1}" => {
      name = "my-vm-${i + 1}"
    }
  }
}

module "simple-vm-example" {

  for_each   = local.vm_instances
  source     = "git::https://github.com/GoogleCloudPlatform/cloud-foundation-fabric.git//modules/compute-vm"
  project_id = var.service-project-id
  zone       = var.zone
  name       = each.value.name
  network_interfaces = [{

    network    = "projects/${var.host-project-id}/global/networks/${module.vpc-host[0].name}"
    subnetwork = "projects/${var.host-project-id}/regions/${var.region}/subnetworks/${var.subnets[0].name}"

  }]

  metadata = {
    startup-script = file("startup-script-for-vm-instances.sh")
  }
}
