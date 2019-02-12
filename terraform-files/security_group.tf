resource "aws_security_group" "cluster" {
  name_prefix = "${var.cluster_name}"
  description = "EKS cluster security group."
  vpc_id      = "${var.vpc_id}"
  count       = "${var.cluster_create_security_group ? 1 : 0}"
}

resource "aws_security_group_rule" "cluster_ingress_internet" {
  description       = "Allow cluster mysql ingress access from the Internet."
  protocol          = "tcp"
  security_group_id = "${aws_security_group.cluster.id}"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 3306
  to_port           = 3306
  type              = "ingress"
  count             = "${var.cluster_create_security_group ? 1 : 0}"
}
