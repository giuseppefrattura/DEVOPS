terraform {
    # Deprecato
    required_providers {
        aws ={
        source = "hashicorp/aws"
        version = "~>3.0"
        }
    }

    backend "s3" {
        bucket = "giuseppefrattura-terraform-status"
        key = "environment/infrastructure/terraform.tfstate"
        encrypt = true
        region = "us-west-1"
    }
}