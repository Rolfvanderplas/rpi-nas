# Set credentials right for system

sudo mkdir -p /mnt/external/appdata/{heimdall,portainer,pihole/config,pihole/dnsmasq.d,pyload,monitoring/telegraf,influxdb,grafana/data,monitoring/grafana}
sudo chown -R 1000:1000 /mnt/external/appdata/*        # except grafana/data
sudo chown -R 472:472 /mnt/external/appdata/grafana/data
sudo chmod -R 755 /mnt/external/appdata
