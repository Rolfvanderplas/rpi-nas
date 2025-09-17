# Set ownership for all directories
sudo chown -R 1000:1000 /mnt/external/appdata/heimdall /mnt/external/appdata/portainer /mnt/external/appdata/pihole /mnt/external/appdata/pyload /mnt/external/appdata/monitoring /mnt/external/appdata/influxdb /mnt/external/appdata/grafana/data
sudo chown -R 472:472 /mnt/external/appdata/grafana/data

# Set permissions recursively to 755 for all directories and files
sudo chmod -R 755 /mnt/external/appdata

# (Optional) set specific permissions for specific files/directories
sudo chown -R 1883:1883 /mnt/external/appdata/mosquitto/config
