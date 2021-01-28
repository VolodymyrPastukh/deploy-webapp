variable "region" {
  description = "Enter region [def.Frankfurt]"
  type        = string
  default     = "eu-central-1"
}


variable "availability_zone" {
    default = "eu-central-1b"
}

variable "instance_type" {
  description = "Enter instance type [def. t2.micro]"
  type        = string
  default     = "t2.micro"
}

variable "ports" {
  description = "List of allowed ports"
  type        = list(any)
  default     = ["80", "443", "22", "666", "3306"]
}

variable "default_set_tags" {
  description = "Shared tags"
  type        = map(any)
  default = {
    Owner      = "Volodymyr Pastukh"
    Project    = "Kursova"
    Enviroment = "Kursova"
  }
}

variable "ssh_key_name" {
  default = "Kursova"
}

variable "ssh_key_path" {
  default = "~/.ssh/Kursova.pem"
}
