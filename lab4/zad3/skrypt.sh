#!/bin/bash

# Pobieramy wynik polecenia `df`, które wyświetla informacje o systemie plików
df_output=$(df)

# Filtrujemy wynik, aby uzyskać tylko woluminy Docker
docker_volumes=$(echo "$df_output" | grep '/mnt/wsl/docker-desktop-data')

# Jeśli istnieją woluminy Docker, obliczamy i wyświetlamy ich zużycie w procentach
if [ ! -z "$docker_volumes" ]; then
    echo "Zużycie przestrzeni dyskowej woluminów Docker:"
    
    # Dla każdego woluminu Docker obliczamy zużycie w procentach i wyświetlamy
    while read -r volume_info; do
        volume=$(echo "$volume_info" | awk '{ print $6 }')
	used=$(echo "$volume_info" | awk '{ print $5 }' | tr -d '%')
        echo "Wolumin: $volume - Zużycie: $used%"
    done <<< "$docker_volumes"
else
    echo "Brak woluminów Docker."
fi
