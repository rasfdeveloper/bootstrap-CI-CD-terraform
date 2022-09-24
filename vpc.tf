resource "aws_vpc" "vpc_tf" {
    cidr_block       = "10.1.0.0/16"
    instance_tenancy = "default"

    tags = local.common_tags
}

resource "aws_route_table" "route_table1" {
    vpc_id = aws_vpc.vpc_tf.id

    tags = local.common_tags

}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.vpc_tf.id
  cidr_block        = aws_vpc.vpc_tf.cidr_block
  availability_zone = "sa-east-1a"

  tags = local.common_tags
}