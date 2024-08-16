terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.9.11"
    }
  }
}

provider "proxmox" {
  # url is the hostname (FQDN if you have one) for the proxmox host you'd like to connect to to issue the commands. my proxmox host is 'prox-1u'. Add /api2/json at the end for the
  pm_api_url = var.api_url
  # api token id is in the form of: <username>@pam!<tokenId>
  pm_api_token_id = var.token_id
  # this is the full secret wrapped in quotes. don't worry, I've already deleted this from my proxmox cluster by the time you read this post
  pm_api_token_secret = var.token_secret
  # leave tls_insecure set to true unless you have your proxmox SSL certificate situation fully sorted out (if you do, you will know)
  pm_tls_insecure = true
  # Evita la clonacion en simultaneo
  pm_parallel = 1
  # Aumenta el tiempo de espera para la clonacion de grandes discos
  pm_timeout = 1800
}


# resource is formatted to be "[type]" "[entity_name]" so in this case we are looking to create a proxmox_vm_qemu 
# entity named test_server



resource "proxmox_vm_qemu" "VM01_VM02_VM03" {

  count = 1 # just want 1 for now, set to 0 and apply to destroy VM
  vmid = "${var.vvmid + count.index + 3}"
  pool = var.pools
  name = "${var.name_id}${count.index + 3}" #count.index starts at 0, so + 1 means this VM will be named test-vm-1 in proxmox
  target_node = var.proxmox_host
  full_clone = true
  clone = var.template_ubuntu
  hastate = "started"
  hagroup = "${var.hagroup}${count.index + 3}"

  # Clone from cloudinit template
  os_type = "cloud-init"


  # basic VM settings here. agent refers to guest agent
  agent = 1
  cores = 4
  sockets = 1
  #cpu = "host"
  memory = 8192


  # Set the boot disk paramters
  scsihw = "virtio-scsi-single"
  bootdisk = "scsi0"
  disk {
    slot = 0
    size = "50G"
    type = "scsi"
    storage = var.stg
    iothread = 1
    backup = 1
    cache = "writeback" 
  }
 

  # Set the network
  network {
    model = "virtio"
    bridge = var.vmbr
  }


  # Ignore changes to the network
  ## MAC address is generated on every apply, causing
  ## TF to think this needs to be rebuilt on every apply
  lifecycle {
    ignore_changes = [
      network,
    ]
  }


  # Network Config
  # have an IP assigned to each (.x1, .x2, .x3, etc.)
  ipconfig0 = "ip=${var.lan}.${var.vmip + count.index + 3}/${var.masc},gw=${var.ip_gw}"


  # sshkeys set using variables. the variable contains the text of the key. (Comentar para Windows)
  sshkeys = var.ssh_key

  }

 
  