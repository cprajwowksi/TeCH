wolumeny=$(df -h | grep /Docker/host | awk '{ print $3 }')
dysk=$(docker system df | grep 'Local Volumes' | awk '{ print $5 }')

echo "$((wolumeny/dysk))"
