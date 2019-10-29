# HOW TO

1. First make sure to run `terraform init` to download the GCP plugin for terraform, it will create the .terraform directory with the plugin and config.
2. Create a service account and download the key in json format to the filesystem and export it `export GOOGLE_CLOUD_KEYFILE_JSON={{path}}` (in our case just run `source setup.sh`)
3. Run `cd terraform && tertraform plan`, to check 2 new resources will be added and all is ok
4. Run `terraform apply` (refine the IAM permissions for the service account if needed as networking creatino and compute engine creation are needed)
5. To destroy the PoC just run `terraform destroy` (we don't want to save the state as it is just a PoC)