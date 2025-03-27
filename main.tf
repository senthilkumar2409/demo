resource "aws_vpc" "vpc_insurance" {
  cidr_block = var.vpc_cidr_block
  tags  = {
  Name = "Vpc-Insurance"

  }
}
# PUBLIC_SUBNET

resource "aws_subnet" "public_subnet_insurance" {
  
  count = length(var.subnet_public_cidr_block)
  availability_zone = var.subnet_az[count.index]
  cidr_block = var.subnet_public_cidr_block[count.index]
  map_public_ip_on_launch = true
  vpc_id = aws_vpc.vpc_insurance.id
  tags = {
    Name = "Public-subnet-Insurance"
 }
}

resource "aws_instance" "public_instance" {
  for_each = {for id, az in var.var.subnet_az : az => id}

  subnet_id = aws_subnet.public_subnet_insurance[each.key].id
  availability_zone = var.subnet_az[each.value]
  instance_type = var.instance_type[each.value]
}