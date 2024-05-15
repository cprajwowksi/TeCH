# Pobierz wartość wolumenów w bajtach
dysk=$(df -h | grep /Docker/host | awk '{ print $3 }' | sed 's/[^0-9]//g')
echo "$dysk"

# Pobierz wartość wolumenów w MB i przekonwertuj na GB
wolumeny=$(docker system df | grep 'Local Volumes' | awk '{ print $5 }' | sed 's/MB//')
wolumeny_gb=$(echo "scale=2; $wolumeny / 1024" | bc)

echo "$wolumeny_gb"

# Oblicz stosunek wolumenów do dysku
ratio=$(echo "scale=2; $wolumeny_gb * 100 / $dysk" | bc)
echo "$ratio%"
