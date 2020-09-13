provider "google" {
  project = "gleaming-block-228801"
  region  = "us-central1"
  zone    = "us-central1-c"
}
// Terraform plugin for creating random ids
resource "random_id" "instance_id" {
 byte_length = 10
}

// Compute Engine instance(s)
resource "google_compute_instance" "default" {
 count        = "3"
 name         = "sysdig-k3s-${count.index +1}"
 machine_type = "n1-standard-1"
 zone         = "us-central1-a"

 boot_disk {
   initialize_params {
     image = "ubuntu-minimal-2004-focal-v20200903"
   }
  }
// Make sure k3sup is installed on all new instances for later steps
 metadata_startup_script = "sudo apt-get update"

 network_interface {
   network = "default"

   access_config {
     // Include this section to give the VM an external ip address
  }
 }
}
output "instance_names" {
  value = google_compute_instance.default.*.name
}
