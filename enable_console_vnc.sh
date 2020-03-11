#!/bin/bash

echo "WARNING, VMs will power on before enabling VNC!"
read -p 'Proxmox Node Name: ' proxmox_node
read -p 'VM ID Range Start: ' vmid_start
read -p 'VM ID Range End: ' vmid_end
read -sp 'VNC Password: ' vnc_password

for ((id=$vmid_start; id<=$vmid_end; id++))
    do
        qm start $id
        pvesh create /nodes/$proxmox_node/qemu/$id/monitor -command="change vnc 0.0.0.0:$id"
        pvesh create /nodes/$proxmox_node/qemu/$id/monitor -command="set_password vnc $vnc_password"
done
echo "VNC ports are configured according to the VM ID number. Ports are assigned as follows: 5900 + VM ID. Example: VM ID 101 will be accessible at port 6001"
