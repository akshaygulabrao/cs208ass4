apt-get install nfs-kernel-server -y
service nfs-kernel-server restart
sed '4s/$/ nfs-server/' /etc/hosts
chmod o+x /var/lib/nova/instances
echo "/var/lib/nova/instances *(rw,sync,fsid=0,no_root_squash)" >> /etc/exports
service nfs-kernel-server restart
#mount -a -v
#sed -i '22s/.*/listen_tls=0/' /etc/libvirt/libvirtd.conf
#sed -i '33s/.*/listen_tcp=1/' /etc/libvirt/libvirtd.conf
#sed -i '163s/.*/auth_tcp="none"/' /etc/libvirt/libvirtd.conf
#sed -i '8s/.*/libvirtd_opts="-l"/' /etc/default/libvirt-bin
#source /root/setup/admin-openrc.sh
