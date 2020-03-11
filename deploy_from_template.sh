#!/bin/bash

read -p 'Template VM ID: ' template_vmid
read -p 'VM ID Range Start: ' vmid_start
read -p 'VM ID Range End: ' vmid_end
read -p 'Target Resource Pool: ' vm_pool
read -p 'New VM Base Name: ' vm_name

for ((id=$vmid_start; id<=$vmid_end; id++))
    do
        qm clone $template_vmid $id --pool $vm_pool --name $vm_name-$id
done
