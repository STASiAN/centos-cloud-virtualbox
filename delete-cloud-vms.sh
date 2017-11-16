#!/bin/bash
images=$(ls -1 | grep raw$ | sed 's/.raw//g')
for vm in $images; do
    if [ -f $vm.vdi ]; then
        VBoxManage controlvm $vm poweroff
        sleep 1
        VBoxManage unregistervm $vm --delete
    fi
    rm -rf $vm.raw $vm-cidata.iso
done
