#!/bin/bash

echo "======="
echo "SSH initiating"

echo "Ensuring files are in place..."
mkdir -p ~/.ssh
[ ! -f "~/.ssh/config" ] && \
    touch ~/.ssh/config

echo "Done."

echo "Do you want to generate an rsa for github? [y/n]"
read ANS

if [ "$ANS" != "y" ]; then
    echo "Aborting."
    exit;
fi

echo "Choose a good name for your file. For e.g: ~/.ssh/id_rsa_my_github_account"
ssh-keygen -t rsa


echo "What FILENAME did you set? "
read ID_RSA_NAME

DATA=$(cat <<-END

Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/$ID_RSA_NAME

END
)
echo "$DATA" >> ~/.ssh/config

echo "Done."
echo "-------"




