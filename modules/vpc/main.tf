
resource "aws_vpc" "vpc" {
    cidr_block = var.vpc.cidr_block
    enable_dns_hostnames = true
    tags = {
        Name = var.vpc.tags.name
        Environment = var.vpc.tags.environment
    }
}

resource "aws_subnet" "subnets" {
    for_each = var.subnets
    vpc_id = aws_vpc.vpc.id
    cidr_block = each.value.cidr_block
    availability_zone = each.value.availability_zone
    map_public_ip_on_launch = each.value.map_public_ip_on_launch
    tags = {
        Name = each.value.tags.name
        Environment = each.value.tags.environment
    }
}
