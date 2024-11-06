# Binary to WIF Converter

This repository provides a script to convert a binary private key to Wallet Import Format (WIF), commonly used for managing Bitcoin keys. The script takes a binary key as input, applies a prefix, calculates a checksum, and converts the result to Base58 to obtain the WIF key.

## Features

- Converts binary input to hexadecimal
- Appends a specified prefix for network identification
- Calculates a checksum using double SHA-256 hashing
- Encodes the final result in Base58 to generate WIF format

## Prerequisites

This script requires the following tools:
- `bc` (for binary to hexadecimal conversion)
- `xxd` (for converting binary data to hexadecimal)
- `openssl` (for SHA-256 hashing)
- `python3` with the `base58` module (for Base58 encoding)

### Check for Pre-installed Modules

On most Linux systems, `bc`, `xxd`, and `openssl` are pre-installed. You can check for their presence using:
```bash
which bc xxd openssl
```

If any of these tools is not installed, follow the instructions below.

## Installation

1. **Install `bc`, `xxd`, and `openssl`**  
   These tools are usually pre-installed on most Linux systems. If not, you can install them using:

   ```bash
   sudo apt-get update
   sudo apt-get install bc xxd openssl
   ```

2. **Install Python3 and `base58` module**  
   Ensure you have Python3 installed. You can check with:
   
   ```bash
   python3 --version
   ```
   
   Then, install the `base58` module (if not already installed):
   
   ```bash
   pip3 install base58
   ```

## Usage

1. Clone the repository and navigate to the directory:

   ```bash
   git clone https://github.com/Tescan-group/bintowif.git
   cd bintowif
   ```

2. Run the script:

   ```bash
   chmod +x bintowif.sh
   ./bintowif.sh
   ```

3. Follow the prompts:
   - Enter the prefix in hexadecimal format (e.g., `80` for Bitcoin mainnet).
   - Enter your binary private key.

4. The script will output the WIF-formatted key.

### Example

```plaintext
$ ./bintowif.sh
Enter the prefix (in hex, e.g., '80' for mainnet): 80
Enter the binary key: 110100101111000100101010101011...

Hexadecimal key: ...
Prefixed key (prefix + hex key): ...
Checksum (first 4 bytes of double SHA-256): ...
WIF hex (prefixed key + checksum): ...
Wallet Import Format (WIF): 5HueCGU8rMjxEXxiPuD5BDuXXmdz...
```

## License

This project is licensed under the MIT License.

## Contributions

Feel free to submit issues and pull requests. Contributions are welcome!
