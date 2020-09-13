# Configure the Packet Provider. 
provider "packet" {
  auth_token = "X1E7irDWCZcdoiu8Z1vh6nyivzUCfBvo"
}

# Declare your project ID
#
# You can find ID of your project form the URL in the Packet web app.
# For example, if you see your devices listed at
# https://app.packet.net/projects/352000fb2-ee46-4673-93a8-de2c2bdba33b
# .. then 352000fb2-ee46-4673-93a8-de2c2bdba33b is your project ID.
locals {
  project_id = "df4104b8-2c27-4867-8708-94fa663ec895"
}

# If you want to create a fresh project, you can create one with packet_project
# 
# resource "packet_project" "cool_project" {
#   name           = "My First Terraform Project"
# }

# Create a device and add it to tf_project_1
resource "packet_device" "web1" {
  hostname         = "pop-packet-1"
  plan             = "c1.small.x86"
  facilities         = ["ewr1"]
  operating_system = "ubuntu_20_04"
  billing_cycle    = "hourly"
  project_id       = local.project_id

  # if you have created project with packet_project resource, refer to its ID
  # project_id       = packet_project.cool_project.id
}
