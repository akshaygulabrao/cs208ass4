sed -i '4s/$/ nfs-server/' /etc/hosts
echo "nfs-server:/ /var/lib/nova/instances nfs4 defaults 0 0" >> /etc/fstab
mount -a -v
sed -i '22s/.*/listen_tls=0/' /etc/libvirt/libvirtd.conf
sed -i '33s/.*/listen_tcp=1/' /etc/libvirt/libvirtd.conf
sed -i '163s/.*/auth_tcp="none"/' /etc/libvirt/libvirtd.conf
sed -i '8s/.*/libvirtd_opts="-l"/' /etc/default/libvirt-bin
service libvirt-bin restart
