data "vkcs_networking_network" "ext-net" {
        name = "ext-net"
}
# Create a network
resource "vkcs_networking_network" "app" {
   name       = "app-tf-net"
}
# Create a subnet
resource "vkcs_networking_subnet" "app" {
   name       = "example-tf-subnet"
   network_id = vkcs_networking_network.app.id
   cidr       = "192.168.199.0/24"
}
# Create a router
resource "vkcs_networking_router" "router" {
   name       = "router-tf-example"
   external_network_id = data.vkcs_networking_network.ext-net.id
}
resource "vkcs_networking_router_interface" "app" {
   router_id  = vkcs_networking_router.router.id
   subnet_id  = vkcs_networking_subnet.app.id
}
