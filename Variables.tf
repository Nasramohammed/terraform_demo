

variable "instance_ami" {}

variable "instance_type" {
  default = "t2.micro"
}


variable "instance_count" {
  type    = number
  default = 2
}

variable "instance_names" {
  type    = list(any)
  default = ["web-server-1", "web-server-2"]
}

variable "create_two_instances" {
  type = bool

}

variable "port_list" {
  type        = list(number)
  description = "list of port for ingress rule"
  default     = [80, 443, 22]
}

