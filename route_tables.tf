## create public route tables
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.mainVpc.id
}

## create route
resource "aws_route" "public_route" {
  route_table_id            = aws_route_table.public_route_table.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}

## attach the route to the subnet
resource "aws_route_table_association" "public1_association" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public2_association" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public_route_table.id
}

#########################################

## create private route tables
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.mainVpc.id
}

## create route
resource "aws_route" "private_route" {
  route_table_id            = aws_route_table.private_route_table.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_nat_gateway.natgw.id
}
## attach the route to the subnet
resource "aws_route_table_association" "private1_association" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private2_association" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private_route_table.id
}