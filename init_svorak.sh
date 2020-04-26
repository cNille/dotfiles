

echo "Installing Svorak..."

SVORAK="/Library/Keyboard Layouts/SvorakA5-Nille-Version.bundle"

[ ! -d "$SVORAK" ] && \
     sudo cp -r SvorakA5-Nille-Version.bundle "$SVORAK"
