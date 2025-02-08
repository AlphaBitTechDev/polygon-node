cd /polygon
wget https://github.com/peak/s5cmd/releases/download/v2.2.2/s5cmd_2.2.2_Linux-64bit.tar.gz
tar -xf s5cmd_2.2.2_Linux-64bit.tar.gz
rm s5cmd_2.2.2_Linux-64bit.tar.gz
cat <<EOF > s5cmd-r2.cfg
[default]
aws_access_key_id = 6b4b819da0d66d9ddf7bb37520c46a16
aws_secret_access_key = ab2dc9b991f4b5055787e8ba9c09c8b4ceb3e183561fbfa7f6475f23fa474766
aws_region = auto
host_base = dd74dc687a5ce54107082a6849814c19.r2.cloudflarestorage.com
host_bucket = dd74dc687a5ce54107082a6849814c19.r2.cloudflarestorage.com
enable_multipart = True
EOF
./s5cmd --credentials-file ./s5cmd-r2.cfg --endpoint-url https://dd74dc687a5ce54107082a6849814c19.r2.cloudflarestorage.com cp --show-progress --concurrency 50 s3://sc-snapshots/heimdall-mainnet_2025-02-07.tar.gz /polygon/
./s5cmd --credentials-file ./s5cmd-r2.cfg --endpoint-url https://dd74dc687a5ce54107082a6849814c19.r2.cloudflarestorage.com cp --show-progress --concurrency 50 s3://sc-snapshots/bor-pebble-mainnet_2024-12-14.tar /polygon/
tar -xzvf heimdall-mainnet_2025-02-07.tar.gz -C /var/lib/heimdall/data
tar -xvf /bor-pebble-mainnet_2024-12-14.tar -C /var/lib/bor/data


# service heimdalld start
# service bor start

# curl localhost:26657/status
# journalctl -u heimdalld.service -f
# journalctl -u bor.service -f

