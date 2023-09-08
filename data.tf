data "aws_ami" "updated_ami_id" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-*"]
  }
}

data "vault_generic_secret" "access_data_demo" {
  path = "kv/Instancesizes"
}