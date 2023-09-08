
resource "aws_instance" "first_instance" {
  count           = var.create_two_instances == true ? 2 : 1
  ami             = data.aws_ami.updated_ami_id.id
  instance_type   = var.instance_type
  security_groups = ["allow_tls"]
  tags = {
    Name = var.instance_names[count.index]
  }

  key_name = "demokey"
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = data.vault_generic_secret.access_data_demo.data["private_key_pem"]
    host        = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum upgrade -y",
      "sudo yum install nginx -y",
      "sudo systemctl start nginx",
      "echo Hello World, from terraform >> newfile.txt"
    ]
  }
}
