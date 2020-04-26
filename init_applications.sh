
echo "Opening install links for applications"

is_installed () {
    IS_INSTALLED=`ls /Applications | grep -i "$1"`
    [ -z "$IS_INSTALLED" ] && open $2
    [ ! -z "$IS_INSTALLED" ] && echo "$IS_INSTALLED is installed..."
}

is_installed "iterm" https://www.iterm2.com/downloads.html

is_installed "mullvad" https://mullvad.net/sv/download

is_installed "dropbox" https://www.dropbox.com/downloading

is_installed "karabiner" https://karabiner-elements.pqrs.org

is_installed "creative cloud" https://www.adobe.com/creativecloud/desktop-app.html#

is_installed "wacom" https://www.wacom.com/en-us/support/product-support/drivers

is_installed "firefox" https://www.mozilla.org/en-US/firefox/new/
