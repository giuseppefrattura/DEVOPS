provider "aws" {
    region = var.region
    access_key = var.access_key
    secret_key = var.secret_key
}


data "aws_ami" "ubuntu" {

    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["099720109477"]
}

resource "aws_instance" "web"{
    ami = data.aws_ami.ubuntu.id
    instance_type = var.instance_type
    associate_public_ip_address = true

    vpc_security_group_ids = [aws_security_group.terraform_ubuntu_sg.id]
    subnet_id = aws_subnet.subnet_public.id

    #inietta la conf. cloud init
    #user_data = data.template_file.user_data.rendered

    tags = {
      "name" = "test ubuntu terraform"
    }

}

# deprecated
# data "template_file" "user_data" {
#     template = file("${path.cwd}/template.yaml")
#     vars = {
#         ssh_key = file("${path.cwd}/keys/tf-cloud-init.pub")
#     }
# }

resource "aws_security_group" "terraform_ubuntu_sg" {

    name = "terraform_uguntu_sg"
    vpc_id = aws_vpc.vpc.id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tpc"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

}