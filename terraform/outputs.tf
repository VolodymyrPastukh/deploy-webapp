output "public_ip" {
    value = [aws_eip.Ubuntu_eip.public_ip]
}
