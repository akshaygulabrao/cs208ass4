source /root/setup/admin-openrc.sh
openstack server list > server_list.txt
mid=`awk 'NR == 4 {print $2}' server_list.txt`
openstack server show $mid > server_show.txt
from_host=`awk '/OS-EXT-SRV-ATTR:host/ {print $4}' server_show.txt`
compute_number=${from_host:3:1}
if [ "$compute_number" = "1" ];
then
        to_host=`awk '/cp-2/ {print $6}' service_list.txt`
else
        to_host=`awk '/cp-1/ {print $6}' service_list.txt`
fi
echo $mid
echo $from_host
echo $to_host
time openstack server migrate $mid --live $to_host --block-migration
