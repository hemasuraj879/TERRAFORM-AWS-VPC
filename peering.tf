resource "aws_vpc_peering_connection" "peer" {
  count = var.peering_reqq ? 1 : 0
  peer_vpc_id   = aws_vpc.vpc.id
  vpc_id        = data.aws_vpc.default.id
  auto_accept   = true

  tags =merge(
    var.common_tags,
    {
        Name = "${var.project_name}-peering-${var.env}"
    }
  )
}

resource "aws_route" "public_peer" {
    count = var.peering_reqq ? 1 : 0
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peer[count.index].id
}

resource "aws_route" "private_peer" {
    count = var.peering_reqq ? 1 : 0
  route_table_id            = aws_route_table.private.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peer[count.index].id
}

resource "aws_route" "default" {
    count = var.peering_reqq ? 1 : 0
  route_table_id            = data.aws_route_table.main.id
  destination_cidr_block    = var.vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peer[count.index].id
}