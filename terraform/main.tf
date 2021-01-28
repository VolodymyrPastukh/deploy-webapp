provider "aws" {
  region = var.region
}

data "aws_ami" "latest_ubuntu" {
  owners      = ["099720109477"]
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

resource "aws_instance" "Ubuntu_server" {
  ami                         = data.aws_ami.latest_ubuntu.id
  subnet_id                   = aws_subnet.Ubuntu_subnet.id
  instance_type               = var.instance_type
  security_groups             = [aws_security_group.Ubuntu_security.id]
  key_name                    = var.ssh_key_name
  tags                        = merge(var.default_set_tags, { Name = "${var.default_set_tags["Enviroment"]}-server" })
}


resource "aws_security_group" "Ubuntu_security" {
  name        = "Ubuntu WS Security Group"
  description = "Allow any ingress trafic on ports"
  vpc_id      = aws_vpc.Ubuntu_vpc.id

  dynamic "ingress" {
    for_each = var.ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge(var.default_set_tags, { Name = "${var.default_set_tags["Enviroment"]}-sg" })
}
