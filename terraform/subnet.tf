resource "aws_subnet" "Ubuntu_subnet" {
    cidr_block = cidrsubnet(aws_vpc.Ubuntu_vpc.cidr_block, 3, 1)
    vpc_id = aws_vpc.Ubuntu_vpc.id
    availability_zone = var.availability_zone
}

resource "aws_internet_gateway" "Ubuntu_gateway" {
    vpc_id = aws_vpc.Ubuntu_vpc.id
}

resource "aws_route_table" "Ubuntu_route" {
    vpc_id = aws_vpc.Ubuntu_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.Ubuntu_gateway.id
    }
}

resource "aws_route_table_association" "Ubuntu_route_ass" {
    subnet_id      = aws_subnet.Ubuntu_subnet.id
    route_table_id = aws_route_table.Ubuntu_route.id
}
