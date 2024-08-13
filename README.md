To provision the resources, do the following:
The modules listed here provison following resources:

1. A host project/network OR can use existing host project
2. A service project/network OR can use existing service project.
3. A service connection policy on host project
4. A NAT and cloud router on host project
5. Firewall rules on host project
6. Service project to provision redis cluster on memorystore, vm instance (a redis client), redis endpoints.
7. GCS bucket on host project to store remote state.
8. Tested the setup using: https://cloud.google.com/memorystore/docs/cluster/connect-cluster-instance#connect_from_a_compute_engine_vm_using_redis_cli
9. Logging is set locally and is being stored as  a local file, uploading here for reference, below method is used:
Logging : $ export TF_LOG=”DEBUG” or TRACE or ERROR
Set up log file using TF_LOG_PATH ,  export TF_LOG_PATH="/home/

    
A. Initialize Terraform with a local backend:

    terraform init

B. Before, provisioning resources, validate your terraform config and verify the resources being created by running below commands:

 a. terraform fmt
 b. terraform validate
 c. terraform plan


 C. For provisioning resources 

    terraform apply

 D. Migrate Terraform state to the remote Cloud Storage backend (run once):

    terraform init -migrate-state




