variable "bastion_sg_allow" {
}

variable "env" {
}

variable "customer" {
}

variable "zones" {
  type    = list(string)
  default = []
}

variable "keypair_name" {
  default = "cycloid"
}

variable "public_subnets_ids" {
  type = list(string)
}

variable "vpc_id" {
  default = ""
}

variable "project" {
  default = "jenkins"
}

variable "extra_tags" {
  default = {}
}

variable "jenkins_disk_size" {
  default = 60
}

variable "jenkins_disk_type" {
  default = "gp2"
}

variable "jenkins_type" {
  default = "t3.small"
}

variable "jenkins_ebs_optimized" {
  default = true
}

locals {
  standard_tags = {
    "cycloid.io" = "true"
    env          = var.env
    project      = var.project
    customer     = var.customer
  }
  merged_tags = merge(local.standard_tags, var.extra_tags)
}
