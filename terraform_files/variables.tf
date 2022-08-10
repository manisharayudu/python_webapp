variable "AWS_ACCESS_KEY" {
    type = string
    default = "AKIAVLPVWNIKIAZ5HPN5"
}

variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
default = "eu-central-1"
}

variable "AMIS" {
    type = map
    default = {
        eu-north-1 = "ami-000e50175c5f86214"
        eu-south-1 = "ami-027f7881d2f6725e1"
        eu-central-1 = "ami-09042b2f6d07d164a"
        eu-west-1 = "ami-0f29c8402f8cce65c"
    }
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "alter_key.pub"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "alter_key"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}
