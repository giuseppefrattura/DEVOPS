variable "region" {
    description = "regione"
}

variable "access_key" {
    description = "Access key"
}

variable "secret_key" {
    description = "Secret key"
}

variable "instance_type" {
    description = "tipo di instanza"
}

variable "cidr_subnet" {
    description = "CIDR blocco per la sottorete"
    default = "10.1.1.0/24"
}

variable "cidr_vpc" {
    description = "CIDR blocco per VPC"
    default = "10.1.0.0/16"
}
