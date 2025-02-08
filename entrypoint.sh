#!/bin/bash

# Check if Heimdall data directory exists, create if not
if [ ! -d /var/lib/heimdall/data ]; then
  mkdir -p /var/lib/heimdall/data
fi

# Check if Bor data directory exists, create if not
if [ ! -d /var/lib/bor/data ]; then
  mkdir -p /var/lib/bor/data
fi

# Start Heimdall
heimdalld start &

# Start Bor (after Heimdall)
bord start

# Keep the container running
tail -f /dev/null