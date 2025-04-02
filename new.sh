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

# Prompt the user for session balance
echo -n "Enter the session balance: "
read SESSION_EARNINGS

# Get the current date and time in the required format
LAST_UPDATE=$(date -Iseconds)

# Make the POST request
curl -X POST "https://kaleidofinance.xyz/api/testnet/update-balance" \
    -H "Content-Type: application/json" \
    -d "{\
         \"wallet\": \"$WALLET_ADDRESS\",\
         \"earnings\": {\
             \"total\": $TOTAL_EARNINGS,\
             \"session\": $SESSION_EARNINGS,\
             \"lastUpdate\": \"$LAST_UPDATE\"\
         }\
        }"
