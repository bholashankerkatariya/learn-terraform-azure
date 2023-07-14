#create security group
resource "azure_security_group" "alow_tls" {
  name        = "allow_tls"
  description = "Allow tls inbound traffic"

  dynamic "ingress" {
    for_each = [80, 433, 3306, 27017, 22]
    content {
      description = "TLS for VPC"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

