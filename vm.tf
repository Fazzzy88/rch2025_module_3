resource "vkcs_networking_secgroup" "admin" {
  name        = "icmp"
}

resource "vkcs_networking_secgroup_rule" "etcd_app_clients" {
  security_group_id = vkcs_networking_secgroup.admin.id
  direction         = "ingress"
  protocol          = "icmp"
  remote_ip_prefix  = "0.0.0.0/0"
}

resource "vkcs_networking_secgroup_rule" "web80" {
  security_group_id = vkcs_networking_secgroup.admin.id
  direction         = "ingress"
  protocol          = "tcp"
  port_range_max    = 80
  port_range_min    = 80
  remote_ip_prefix  = "0.0.0.0/0"
}

resource "vkcs_networking_secgroup_rule" "web443" {
  security_group_id = vkcs_networking_secgroup.admin.id
  direction         = "ingress"
  protocol          = "tcp"
  port_range_max    = 443
  port_range_min    = 443
  remote_ip_prefix  = "0.0.0.0/0"
}


resource "vkcs_compute_keypair" "key" {
  name       = "existing-key-tf-example"
  public_key = file("${path.module}/public")
}

resource "vkcs_compute_instance" "WEB1" {
  name = "WEB1"
  flavor_name       = "STD2-1-1"
  block_device {
    source_type      = "image"
    uuid             = "785bd3c3-6d63-44f8-b2ad-4e37afc38a38"
    destination_type = "volume"
    volume_size      = 15
    volume_type      = "ceph-hdd"
    delete_on_termination = true
  }
  key_pair = vkcs_compute_keypair.key.name
  network {
    port = vkcs_networking_port.WEB1_port.id
  }
  security_groups = [
      "default",
      vkcs_networking_secgroup.admin.name,
      "ssh"
  ]
  depends_on = [
    vkcs_networking_router_interface.app
  ]
}

resource "vkcs_compute_instance" "WEB2" {
  availability_zone = "GZ1"
  flavor_name       = "STD2-1-1"
  name              = "WEB2"
  block_device {
    source_type      = "image"
    uuid             = "785bd3c3-6d63-44f8-b2ad-4e37afc38a38"
    destination_type = "volume"
    volume_size      = 15
    volume_type      = "ceph-hdd"
    delete_on_termination = true
  }

  network {
    port = vkcs_networking_port.WEB2_port.id
  }

  key_pair = vkcs_compute_keypair.key.name

  security_groups = [
      "default",
      vkcs_networking_secgroup.admin.name,
      "ssh"
  ]

  depends_on = [
    vkcs_networking_router_interface.app
  ]
}


resource "vkcs_networking_port" "WEB1_port" {
  name       = "WEB1_port"
  network_id = vkcs_networking_network.app.id
  fixed_ip {
    subnet_id = vkcs_networking_subnet.app.id
  }
}

resource "vkcs_networking_port" "WEB2_port" {
  name       = "WEB2_port"
  network_id = vkcs_networking_network.app.id
  fixed_ip {
    subnet_id = vkcs_networking_subnet.app.id
  }
}


resource "vkcs_networking_floatingip" "WEB1_associated_fip" {
  pool    = "internet"
  port_id = vkcs_networking_port.WEB1_port.id
}


resource "vkcs_networking_floatingip" "WEB2_associated_fip" {
  pool    = "internet"
  port_id = vkcs_networking_port.WEB2_port.id
}
