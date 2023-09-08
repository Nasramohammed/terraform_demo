resource "aws_eip" "fixed_ip" {
  domain = "vpc"
  count  = var.create_two_instances == true ? 2 : 1
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.first_instance[count.index].id
  allocation_id = aws_eip.fixed_ip[count.index].id
  count         = var.create_two_instances == true ? 2 : 1
}

# output "instance_ip_address" {
#   value = aws_instance.first_instance.[count.index]public_ip
#   count = 2
# }