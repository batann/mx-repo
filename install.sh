#!/bin/bash
read -p 'passphrase  >>>   ' passphrase
sudo cp /home/batan/mx-repo/repo.tar.gz.gpg /tmp/
gpg --batch --yes --passphrase "$PASSPHRASE" --decrypt /tmp/repo.tar.gz.gpg > /tmp/repo.tar.gz
	if [ $? -ne 0 ]; then
		echo "Error: Failed to decrypt the file."
		exit 1
	fi
sudo tar -xvzf /tmp/repo.tar.gz -C /home/batan/
if [ $? -ne 0 ]; then
			echo "Error: Failed to extract the archive."
			exit 1
		fi

sudo bash /home/batan/repo/install.sh
sudo apt update && sudo apt upgrade -y
sudo apt install mx-snapshot mx-live-usb-maker mx-cleanup iso-template-generic
sudo trash /home/batan/repo
sudo trash /home/batan/mx-repo
sudo trash /tmp/repo.tar.gz
sudo trash /tmp/repo.tar.gz.gpg
