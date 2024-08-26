# resource "null_resource" "validate_project_ids" {
#   provisioner "local-exec" {
#     command = <<EOT
#     if [ "${var.host-project-id}" == "${var.service-project-id}" ]; then
#       echo "Error: host_project_id and service_project_id must be different." >&2
#       exit 1
#     fi
#     EOT
#   }
# }
