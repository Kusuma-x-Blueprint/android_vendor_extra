# Shebang is intentionally missing - do not run as a script

# Build ID
export TARGET_UNOFFICIAL_BUILD_ID=KUSUMA

# Sign with own key
export OWN_KEYS_DIR=
if [ -d "$HOME/.android-certs" ]; then
export OWN_KEYS_DIR=~/.android-certs
else
echo -e "There's no android-certs directory.\nPlease make it using tutorial from:\nhttps://wiki.lineageos.org/signing_builds#generating-the-keys\nWill be using default test-keys."
fi
