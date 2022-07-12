output "host_id" {
    description = "ip" 
    value = aws_instance.web.public_ip
}

output "host_dns" {
    description = "dns" 
    value = aws_instance.web.public_dns
}

