# Configure the AWS Provider
provider "aws" {
  region     = "eu-west-1"
  access_key = data.vault_generic_secret.access_data_demo.data["access_key"]
  secret_key = data.vault_generic_secret.access_data_demo.data["secret_key"]
  
}

provider "vault" {
  address = "https://terraform-cluster-public-vault-548971bd.5a186b1d.z1.hashicorp.cloud:8200"
  token   = "hvs.CAESIAJbjoH4-XgwYHcqAWpH1pVauvhzM5mc8_8NS7uJjS5IGicKImh2cy5NcG5SUFpRdzBVNnIyWHRMS24zUkd5eXouMlNxZngQvwI"
}
# resource "local_file" "vault_test_output_file" {
#   filename = "vault_test_output.txt"
#   content  = "@${data.vault_generic_secret.access_data_demo.data["access_key"]}@\r\n@${data.vault_generic_secret.access_data_demo.data["secret_key"]}@"
# }
