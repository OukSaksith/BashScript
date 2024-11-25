#!/bin/bash
# Script to archive a directory or file and encrypt the archive

# Prompt for the path to archive
read -p "Enter the path to archive: " path_to_archive

# Check if the provided path exists
if [ ! -e "$path_to_archive" ]; then
    echo "Error: The provided path does not exist."
    exit 1
fi

# Prompt for the name of the output archive file
read -p "Enter the name for the output archive file (without extension): " archive_name

# Create the tar archive
tar -czf "$archive_name.tar.gz" "$path_to_archive"

# Check if the tar operation was successful
if [ $? -eq 0 ]; then
    echo "Archive created successfully: $archive_name.tar.gz"
else
    echo "Error creating the archive."
    exit 1
fi

# Prompt for the GPG passphrase to encrypt the archive
read -sp "Enter a passphrase to encrypt the archive: " passphrase
echo

# Encrypt the archive using gpg
gpg --batch --yes --passphrase "$passphrase" -c "$archive_name.tar.gz"

# Check if the encryption was successful
if [ $? -eq 0 ]; then
    echo "Encryption successful. Encrypted file: $archive_name.tar.gz.gpg"
else
    echo "Error during encryption."
    exit 1
fi

# Optionally, remove the original unencrypted archive
rm "$archive_name.tar.gz"

echo "The unencrypted archive has been removed."

