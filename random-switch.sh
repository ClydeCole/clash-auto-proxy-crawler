#!/usr/bin/env bash
# random_switch.sh
# This file's author is `Clyde Cole`
# Author GitHub: https://github.com/ClydeCole/
# If you are unsure how to use this，please refer to the documentation at: [https://github.com/ClydeCole/clash-auto-proxy-crawler]


###### Configurations #####
# CLASH_API:  External Controller Listen Address (from clash verge's External Controller settings)
# API_KEY:    API key for the External Controller
# GROUP_NAME: Name of your proxy group
CLASH_API="http://127.0.0.1:9097"
API_KEY="asdfs45wdfas"
GROUP_NAME="MyPool"
###### Configurations #####


# Get list of VPN nodes
nodes=$(curl -s -H "Authorization: Bearer $API_KEY" "$CLASH_API/proxies/$GROUP_NAME" | jq -r '.all[]')
# Random a proxy node
node=$(echo "$nodes" | shuf -n1)

# Change node
curl -s -X PUT -H "Authorization: Bearer $API_KEY" \
    -H "Content-Type: application/json" \
    -d "{\"name\":\"$node\"}" \
    "$CLASH_API/proxies/$GROUP_NAME"

echo "$node"
