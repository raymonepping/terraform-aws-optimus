resource "aws_vpc_ipam" "main" {
  description = var.ipam_description
  operating_regions {
    region_name = var.region
  }

  tags = {
    Name = var.ipam_name
  }
}

resource "aws_vpc_ipam_pool" "public" {
  address_family       = "ipv4"
  ipam_scope_id        = aws_vpc_ipam.main.private_default_scope_id
  locale               = var.region
  allocation_default_netmask_length = 24
  auto_import          = true
  description          = "Public pool"
  tags = {
    Name = "${var.ipam_name}-public-pool"
  }
}

resource "aws_vpc_ipam_pool_cidr" "public_range" {
  ipam_pool_id = aws_vpc_ipam_pool.public.id
  cidr         = var.ipam_cidr
}
