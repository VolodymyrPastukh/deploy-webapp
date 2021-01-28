
resource "aws_vpc" "Ubuntu_vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true
}

resource "aws_eip" "Ubuntu_eip" {
    instance = aws_instance.Ubuntu_server.id
    vpc      = true
}
