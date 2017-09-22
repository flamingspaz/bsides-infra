output "cluster_name" {
  value = "k8s.paas.mozilla.community"
}

output "master_security_group_ids" {
  value = ["${aws_security_group.masters-k8s-paas-mozilla-community.id}"]
}

output "masters_role_arn" {
  value = "${aws_iam_role.masters-k8s-paas-mozilla-community.arn}"
}

output "masters_role_name" {
  value = "${aws_iam_role.masters-k8s-paas-mozilla-community.name}"
}

output "node_security_group_ids" {
  value = ["${aws_security_group.nodes-k8s-paas-mozilla-community.id}"]
}

output "node_subnet_ids" {
  value = ["${aws_subnet.eu-central-1a-k8s-paas-mozilla-community.id}", "${aws_subnet.eu-central-1b-k8s-paas-mozilla-community.id}", "${aws_subnet.eu-central-1c-k8s-paas-mozilla-community.id}"]
}

output "nodes_role_arn" {
  value = "${aws_iam_role.nodes-k8s-paas-mozilla-community.arn}"
}

output "nodes_role_name" {
  value = "${aws_iam_role.nodes-k8s-paas-mozilla-community.name}"
}

output "region" {
  value = "eu-central-1"
}

output "vpc_id" {
  value = "${aws_vpc.k8s-paas-mozilla-community.id}"
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_autoscaling_group" "master-eu-central-1a-masters-k8s-paas-mozilla-community" {
  name                 = "master-eu-central-1a.masters.k8s.paas.mozilla.community"
  launch_configuration = "${aws_launch_configuration.master-eu-central-1a-masters-k8s-paas-mozilla-community.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${aws_subnet.eu-central-1a-k8s-paas-mozilla-community.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "k8s.paas.mozilla.community"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-eu-central-1a.masters.k8s.paas.mozilla.community"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }

  tag = {
    key                 = "project"
    value               = "bsides"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group" "master-eu-central-1b-masters-k8s-paas-mozilla-community" {
  name                 = "master-eu-central-1b.masters.k8s.paas.mozilla.community"
  launch_configuration = "${aws_launch_configuration.master-eu-central-1b-masters-k8s-paas-mozilla-community.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${aws_subnet.eu-central-1b-k8s-paas-mozilla-community.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "k8s.paas.mozilla.community"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-eu-central-1b.masters.k8s.paas.mozilla.community"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }

  tag = {
    key                 = "project"
    value               = "bsides"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group" "master-eu-central-1c-masters-k8s-paas-mozilla-community" {
  name                 = "master-eu-central-1c.masters.k8s.paas.mozilla.community"
  launch_configuration = "${aws_launch_configuration.master-eu-central-1c-masters-k8s-paas-mozilla-community.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${aws_subnet.eu-central-1c-k8s-paas-mozilla-community.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "k8s.paas.mozilla.community"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-eu-central-1c.masters.k8s.paas.mozilla.community"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }

  tag = {
    key                 = "project"
    value               = "bsides"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group" "nodes-k8s-paas-mozilla-community" {
  name                 = "nodes.k8s.paas.mozilla.community"
  launch_configuration = "${aws_launch_configuration.nodes-k8s-paas-mozilla-community.id}"
  max_size             = 5
  min_size             = 5
  vpc_zone_identifier  = ["${aws_subnet.eu-central-1a-k8s-paas-mozilla-community.id}", "${aws_subnet.eu-central-1b-k8s-paas-mozilla-community.id}", "${aws_subnet.eu-central-1c-k8s-paas-mozilla-community.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "k8s.paas.mozilla.community"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "nodes.k8s.paas.mozilla.community"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/node"
    value               = "1"
    propagate_at_launch = true
  }

  tag = {
    key                 = "project"
    value               = "bsides"
    propagate_at_launch = true
  }
}

resource "aws_ebs_volume" "a-etcd-events-k8s-paas-mozilla-community" {
  availability_zone = "eu-central-1a"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster    = "k8s.paas.mozilla.community"
    Name                 = "a.etcd-events.k8s.paas.mozilla.community"
    "k8s.io/etcd/events" = "a/a,b,c"
    "k8s.io/role/master" = "1"
  }
}

resource "aws_ebs_volume" "a-etcd-main-k8s-paas-mozilla-community" {
  availability_zone = "eu-central-1a"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster    = "k8s.paas.mozilla.community"
    Name                 = "a.etcd-main.k8s.paas.mozilla.community"
    "k8s.io/etcd/main"   = "a/a,b,c"
    "k8s.io/role/master" = "1"
  }
}

resource "aws_ebs_volume" "b-etcd-events-k8s-paas-mozilla-community" {
  availability_zone = "eu-central-1b"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster    = "k8s.paas.mozilla.community"
    Name                 = "b.etcd-events.k8s.paas.mozilla.community"
    "k8s.io/etcd/events" = "b/a,b,c"
    "k8s.io/role/master" = "1"
  }
}

resource "aws_ebs_volume" "b-etcd-main-k8s-paas-mozilla-community" {
  availability_zone = "eu-central-1b"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster    = "k8s.paas.mozilla.community"
    Name                 = "b.etcd-main.k8s.paas.mozilla.community"
    "k8s.io/etcd/main"   = "b/a,b,c"
    "k8s.io/role/master" = "1"
  }
}

resource "aws_ebs_volume" "c-etcd-events-k8s-paas-mozilla-community" {
  availability_zone = "eu-central-1c"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster    = "k8s.paas.mozilla.community"
    Name                 = "c.etcd-events.k8s.paas.mozilla.community"
    "k8s.io/etcd/events" = "c/a,b,c"
    "k8s.io/role/master" = "1"
  }
}

resource "aws_ebs_volume" "c-etcd-main-k8s-paas-mozilla-community" {
  availability_zone = "eu-central-1c"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster    = "k8s.paas.mozilla.community"
    Name                 = "c.etcd-main.k8s.paas.mozilla.community"
    "k8s.io/etcd/main"   = "c/a,b,c"
    "k8s.io/role/master" = "1"
  }
}

resource "aws_iam_instance_profile" "masters-k8s-paas-mozilla-community" {
  name = "masters.k8s.paas.mozilla.community"
  role = "${aws_iam_role.masters-k8s-paas-mozilla-community.name}"
}

resource "aws_iam_instance_profile" "nodes-k8s-paas-mozilla-community" {
  name = "nodes.k8s.paas.mozilla.community"
  role = "${aws_iam_role.nodes-k8s-paas-mozilla-community.name}"
}

resource "aws_iam_role" "masters-k8s-paas-mozilla-community" {
  name               = "masters.k8s.paas.mozilla.community"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_masters.k8s.paas.mozilla.community_policy")}"
}

resource "aws_iam_role" "nodes-k8s-paas-mozilla-community" {
  name               = "nodes.k8s.paas.mozilla.community"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_nodes.k8s.paas.mozilla.community_policy")}"
}

resource "aws_iam_role_policy" "masters-k8s-paas-mozilla-community" {
  name   = "masters.k8s.paas.mozilla.community"
  role   = "${aws_iam_role.masters-k8s-paas-mozilla-community.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_masters.k8s.paas.mozilla.community_policy")}"
}

resource "aws_iam_role_policy" "nodes-k8s-paas-mozilla-community" {
  name   = "nodes.k8s.paas.mozilla.community"
  role   = "${aws_iam_role.nodes-k8s-paas-mozilla-community.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_nodes.k8s.paas.mozilla.community_policy")}"
}

resource "aws_internet_gateway" "k8s-paas-mozilla-community" {
  vpc_id = "${aws_vpc.k8s-paas-mozilla-community.id}"

  tags = {
    KubernetesCluster = "k8s.paas.mozilla.community"
    Name              = "k8s.paas.mozilla.community"
  }
}

resource "aws_key_pair" "kubernetes-k8s-paas-mozilla-community-850e884665a817c91e4b6d6b3e8b2586" {
  key_name   = "kubernetes.k8s.paas.mozilla.community-85:0e:88:46:65:a8:17:c9:1e:4b:6d:6b:3e:8b:25:86"
  public_key = "${file("${path.module}/data/aws_key_pair_kubernetes.k8s.paas.mozilla.community-850e884665a817c91e4b6d6b3e8b2586_public_key")}"
}

resource "aws_launch_configuration" "master-eu-central-1a-masters-k8s-paas-mozilla-community" {
  name_prefix                 = "master-eu-central-1a.masters.k8s.paas.mozilla.community-"
  image_id                    = "ami-ea44e885"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.kubernetes-k8s-paas-mozilla-community-850e884665a817c91e4b6d6b3e8b2586.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-k8s-paas-mozilla-community.id}"
  security_groups             = ["${aws_security_group.masters-k8s-paas-mozilla-community.id}"]
  associate_public_ip_address = true
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-eu-central-1a.masters.k8s.paas.mozilla.community_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 20
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }
}

resource "aws_launch_configuration" "master-eu-central-1b-masters-k8s-paas-mozilla-community" {
  name_prefix                 = "master-eu-central-1b.masters.k8s.paas.mozilla.community-"
  image_id                    = "ami-ea44e885"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.kubernetes-k8s-paas-mozilla-community-850e884665a817c91e4b6d6b3e8b2586.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-k8s-paas-mozilla-community.id}"
  security_groups             = ["${aws_security_group.masters-k8s-paas-mozilla-community.id}"]
  associate_public_ip_address = true
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-eu-central-1b.masters.k8s.paas.mozilla.community_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 20
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }
}

resource "aws_launch_configuration" "master-eu-central-1c-masters-k8s-paas-mozilla-community" {
  name_prefix                 = "master-eu-central-1c.masters.k8s.paas.mozilla.community-"
  image_id                    = "ami-ea44e885"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.kubernetes-k8s-paas-mozilla-community-850e884665a817c91e4b6d6b3e8b2586.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-k8s-paas-mozilla-community.id}"
  security_groups             = ["${aws_security_group.masters-k8s-paas-mozilla-community.id}"]
  associate_public_ip_address = true
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-eu-central-1c.masters.k8s.paas.mozilla.community_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 20
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }
}

resource "aws_launch_configuration" "nodes-k8s-paas-mozilla-community" {
  name_prefix                 = "nodes.k8s.paas.mozilla.community-"
  image_id                    = "ami-ea44e885"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.kubernetes-k8s-paas-mozilla-community-850e884665a817c91e4b6d6b3e8b2586.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.nodes-k8s-paas-mozilla-community.id}"
  security_groups             = ["${aws_security_group.nodes-k8s-paas-mozilla-community.id}"]
  associate_public_ip_address = true
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_nodes.k8s.paas.mozilla.community_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 20
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }
}

resource "aws_route" "0-0-0-0--0" {
  route_table_id         = "${aws_route_table.k8s-paas-mozilla-community.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.k8s-paas-mozilla-community.id}"
}

resource "aws_route_table" "k8s-paas-mozilla-community" {
  vpc_id = "${aws_vpc.k8s-paas-mozilla-community.id}"

  tags = {
    KubernetesCluster = "k8s.paas.mozilla.community"
    Name              = "k8s.paas.mozilla.community"
  }
}

resource "aws_route_table_association" "eu-central-1a-k8s-paas-mozilla-community" {
  subnet_id      = "${aws_subnet.eu-central-1a-k8s-paas-mozilla-community.id}"
  route_table_id = "${aws_route_table.k8s-paas-mozilla-community.id}"
}

resource "aws_route_table_association" "eu-central-1b-k8s-paas-mozilla-community" {
  subnet_id      = "${aws_subnet.eu-central-1b-k8s-paas-mozilla-community.id}"
  route_table_id = "${aws_route_table.k8s-paas-mozilla-community.id}"
}

resource "aws_route_table_association" "eu-central-1c-k8s-paas-mozilla-community" {
  subnet_id      = "${aws_subnet.eu-central-1c-k8s-paas-mozilla-community.id}"
  route_table_id = "${aws_route_table.k8s-paas-mozilla-community.id}"
}

resource "aws_security_group" "masters-k8s-paas-mozilla-community" {
  name        = "masters.k8s.paas.mozilla.community"
  vpc_id      = "${aws_vpc.k8s-paas-mozilla-community.id}"
  description = "Security group for masters"

  tags = {
    KubernetesCluster = "k8s.paas.mozilla.community"
    Name              = "masters.k8s.paas.mozilla.community"
  }
}

resource "aws_security_group" "nodes-k8s-paas-mozilla-community" {
  name        = "nodes.k8s.paas.mozilla.community"
  vpc_id      = "${aws_vpc.k8s-paas-mozilla-community.id}"
  description = "Security group for nodes"

  tags = {
    KubernetesCluster = "k8s.paas.mozilla.community"
    Name              = "nodes.k8s.paas.mozilla.community"
  }
}

resource "aws_security_group_rule" "all-master-to-master" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-k8s-paas-mozilla-community.id}"
  source_security_group_id = "${aws_security_group.masters-k8s-paas-mozilla-community.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "all-master-to-node" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-k8s-paas-mozilla-community.id}"
  source_security_group_id = "${aws_security_group.masters-k8s-paas-mozilla-community.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "all-node-to-node" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-k8s-paas-mozilla-community.id}"
  source_security_group_id = "${aws_security_group.nodes-k8s-paas-mozilla-community.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "https-external-to-master-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.masters-k8s-paas-mozilla-community.id}"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "master-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.masters-k8s-paas-mozilla-community.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "node-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.nodes-k8s-paas-mozilla-community.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "node-to-master-protocol-ipip" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-k8s-paas-mozilla-community.id}"
  source_security_group_id = "${aws_security_group.nodes-k8s-paas-mozilla-community.id}"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "4"
}

resource "aws_security_group_rule" "node-to-master-tcp-1-4001" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-k8s-paas-mozilla-community.id}"
  source_security_group_id = "${aws_security_group.nodes-k8s-paas-mozilla-community.id}"
  from_port                = 1
  to_port                  = 4001
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-tcp-4003-65535" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-k8s-paas-mozilla-community.id}"
  source_security_group_id = "${aws_security_group.nodes-k8s-paas-mozilla-community.id}"
  from_port                = 4003
  to_port                  = 65535
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-udp-1-65535" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-k8s-paas-mozilla-community.id}"
  source_security_group_id = "${aws_security_group.nodes-k8s-paas-mozilla-community.id}"
  from_port                = 1
  to_port                  = 65535
  protocol                 = "udp"
}

resource "aws_security_group_rule" "ssh-external-to-master-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.masters-k8s-paas-mozilla-community.id}"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "ssh-external-to-node-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.nodes-k8s-paas-mozilla-community.id}"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_subnet" "eu-central-1a-k8s-paas-mozilla-community" {
  vpc_id            = "${aws_vpc.k8s-paas-mozilla-community.id}"
  cidr_block        = "172.20.32.0/19"
  availability_zone = "eu-central-1a"

  tags = {
    KubernetesCluster                                  = "k8s.paas.mozilla.community"
    Name                                               = "eu-central-1a.k8s.paas.mozilla.community"
    "kubernetes.io/cluster/k8s.paas.mozilla.community" = "owned"
  }
}

resource "aws_subnet" "eu-central-1b-k8s-paas-mozilla-community" {
  vpc_id            = "${aws_vpc.k8s-paas-mozilla-community.id}"
  cidr_block        = "172.20.64.0/19"
  availability_zone = "eu-central-1b"

  tags = {
    KubernetesCluster                                  = "k8s.paas.mozilla.community"
    Name                                               = "eu-central-1b.k8s.paas.mozilla.community"
    "kubernetes.io/cluster/k8s.paas.mozilla.community" = "owned"
  }
}

resource "aws_subnet" "eu-central-1c-k8s-paas-mozilla-community" {
  vpc_id            = "${aws_vpc.k8s-paas-mozilla-community.id}"
  cidr_block        = "172.20.96.0/19"
  availability_zone = "eu-central-1c"

  tags = {
    KubernetesCluster                                  = "k8s.paas.mozilla.community"
    Name                                               = "eu-central-1c.k8s.paas.mozilla.community"
    "kubernetes.io/cluster/k8s.paas.mozilla.community" = "owned"
  }
}

resource "aws_vpc" "k8s-paas-mozilla-community" {
  cidr_block           = "172.20.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    KubernetesCluster                                  = "k8s.paas.mozilla.community"
    Name                                               = "k8s.paas.mozilla.community"
    "kubernetes.io/cluster/k8s.paas.mozilla.community" = "owned"
  }
}

resource "aws_vpc_dhcp_options" "k8s-paas-mozilla-community" {
  domain_name         = "eu-central-1.compute.internal"
  domain_name_servers = ["AmazonProvidedDNS"]

  tags = {
    KubernetesCluster = "k8s.paas.mozilla.community"
    Name              = "k8s.paas.mozilla.community"
  }
}

resource "aws_vpc_dhcp_options_association" "k8s-paas-mozilla-community" {
  vpc_id          = "${aws_vpc.k8s-paas-mozilla-community.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.k8s-paas-mozilla-community.id}"
}

terraform = {
  required_version = ">= 0.9.3"
}
