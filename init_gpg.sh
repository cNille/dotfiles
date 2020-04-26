


open https://help.github.com/en/github/authenticating-to-github/generating-a-new-gpg-key

gpg --full-generate-key

if [ $? -eq 0 ]; then
    gpg --list-secret-keys --keyid-format LONG
else
    exit;
fi

