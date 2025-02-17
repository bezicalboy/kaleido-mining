#!/bin/bash

# Install figlet if not installed
if ! command -v figlet &> /dev/null; then
    echo "Installing figlet..."
    sudo apt-get update && sudo apt-get install -y figlet
fi

# Display logo using figlet
figlet "hellarxn"
echo "You need to stop your kaleido mining first"

# Prompt the user for their wallet address
echo -n "Enter your wallet address: "
read WALLET_ADDRESS

# Prompt the user for their total balance
echo -n "Enter your total balance: "
read TOTAL_EARNINGS
PAID_EARNINGS=$TOTAL_EARNINGS
PENDING_EARNINGS=0.0033270851301854527

# Make the POST request
curl -X POST "https://kaleidofinance.xyz/api/testnet/update-balance" \
     -H "Content-Type: application/json" \
     -d "{\
          \"wallet\": \"$WALLET_ADDRESS\",\
          \"earnings\": {\
            \"total\": $TOTAL_EARNINGS,\
            \"pending\": $PENDING_EARNINGS,\
            \"paid\": $PAID_EARNINGS\
          }\
         }"
