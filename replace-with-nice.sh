virt-install \
  --virt-type kvm \
  --name cosmic24 \
  --os-variant generic \
  --memory 16384 \
  --cpu host-passthrough \
  --controller type=scsi,model=virtio-scsi \
  --vcpus=4,maxvcpus=4 \
  --boot uefi \
  --disk path=/data/vms/cosmic24.qcow2 \
  --channel unix,mode=bind,target_type=virtio \
  --cdrom /data/isos/pop-os_24.04_amd64_nvidia_9.iso

