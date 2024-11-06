#!/bin/bash

# Function to convert binary to hexadecimal
binary_to_hex() {
    echo "obase=16; ibase=2; $1" | bc
}

# Function to calculate double SHA-256 hash and get the first 8 hex characters
double_sha256_checksum() {
    local data="$1"
    checksum=$(echo -n "$data" | xxd -r -p | openssl dgst -sha256 -binary | openssl dgst -sha256 -binary | xxd -p -c 256)
    echo "${checksum:0:8}"
}

# Function to encode hex to Base58 (simplified for demonstration)
encode_base58() {
    # Using Python for base58 encoding due to Bash limitations
    python3 -c "import base58; print(base58.b58encode(bytes.fromhex('$1')).decode())"
}

# Prompt user for prefix and binary input
read -p "Enter the prefix (in hex, e.g., '80' for mainnet): " prefix
read -p "Enter the binary key: " binary_key

echo "Enter the Binary: $binary_key"

# Step 1: Convert binary to hexadecimal
hex_key=$(binary_to_hex "$binary_key")
echo "Hexadecimal key: $hex_key"

# Step 2: Prepend prefix to the hexadecimal key
prefixed_key="${prefix}${hex_key}"
echo "Prefixed key (prefix + hex key): $prefixed_key"

# Step 3: Calculate the checksum
checksum=$(double_sha256_checksum "$prefixed_key")
echo "Checksum (first 4 bytes of double SHA-256): $checksum"

# Step 4: Append checksum to the prefixed key
wif_hex="${prefixed_key}${checksum}"
echo "WIF hex (prefixed key + checksum): $wif_hex"

# Step 5: Encode the final hex to Base58
wif=$(encode_base58 "$wif_hex")
echo "Wallet Import Format (WIF): $wif"
