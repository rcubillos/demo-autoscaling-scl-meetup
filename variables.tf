variable "profile_name" {
  default = "rodrigocubillos"
}


variable "demo_ami" {
  default = "ami-c58c1dd3"
}


variable "front_subnets" {
  default = ["subnet-eb5b39a3","subnet-3c229710"]
}

variable "instance_role" {
  default = "EC2getMessagesRole2"
}

variable "queue_name" {
  default = "DEMO_INPUT"
}

variable "region" {
  default = "us-east-1"
}
