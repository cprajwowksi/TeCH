
# Pobierz wartość wolumenów w MB
dysk=$(df | grep /Docker/host | awk '{ print $3 }' | sed 's/M//')

echo "$dysk"
wolumeny=$(docker system df | grep 'Local Volumes' | awk '{ print $5}' | sed 's/MB//')
echo "$wolumeny"

# Przekonwertuj wartość wolumenów na GB i oblicz stosunek
echo "$((wolumeny / dysk_gb))"%

