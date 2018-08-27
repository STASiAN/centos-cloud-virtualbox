#!/bin/bash
dir=~/VirtualBox\ VMs
cd "$dir"
images=$(ls -1 | grep vdi$ | sed 's/.vdi//g')
for vm in $images; do
    if [ -f $vm.vdi ]; then
        VBoxManage controlvm $vm poweroff
        sleep 1
        VBoxManage snapshot $vm delete $vm-deployed
        VBoxManage unregistervm $vm --delete
    fi
    rm -rf $vm $vm.vdi $vm.raw $vm-cidata.iso
done
