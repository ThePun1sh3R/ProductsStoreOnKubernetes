# Define provider for your local server (e.g., using SSH)
provider "ssh" {
  host = "arezoo-mohammadi-nl-rg2.maxtld.dev:2233"  # Update with your server's IP or hostname
  user = "arezoo"  # Update with your SSH username
  private_key = file("~/.ssh/id_rsa")  # Update with your SSH private key path
}

# Provision resources for your Kubernetes cluster (e.g., VMs, networking)
resource "null_resource" "kubernetes_cluster" {
  # Use provisioners to run scripts for setting up Kubernetes on your server
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "scripts/setup-k8s.sh"  # Replace with your setup script
  }
}
