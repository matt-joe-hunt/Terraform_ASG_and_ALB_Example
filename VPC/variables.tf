variable "vpc-cidr-block" {
    type = string
    default = "10.0.0.0/16"
}

variable "public-subnet-A-cidr-block" {
    type = string
    default = "10.0.1.0/24"
}

variable "public-subnet-B-cidr-block" {
    type = string
    default = "10.0.2.0/24"
}

variable "vpc-name" {
    type = string
}