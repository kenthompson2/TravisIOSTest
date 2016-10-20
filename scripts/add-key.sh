#!/bin/sh

# $1 - KEY_PASSWORD $2 - PROFILE_NAME $3 - CERT_NAME

# Create a custom keychain
security create-keychain -p travis travis.keychain

# Make the custom keychain default, so xcodebuild will use it for signing
security default-keychain -s travis.keychain

# Unlock the keychain
security unlock-keychain -p travis travis.keychain

# Set keychain timeout to 2 hour for long builds
# see http://www.egeek.me/2013/02/23/jenkins-and-xcode-user-interaction-is-not-allowed/
security set-keychain-settings -t 7200 -u travis.keychain

# Add certificates to keychain and allow codesign to access them
security import ./scripts/certs/apple.cer -k ~/Library/Keychains/travis.keychain -T /usr/bin/codesign
security import ./scripts/certs/dist.cer -k ~/Library/Keychains/travis.keychain -T /usr/bin/codesign
security import ./scripts/certs/dist.p12 -k ~/Library/Keychains/travis.keychain -P $KEY_PASSWORD -T /usr/bin/codesign


# Put the provisioning profile in place
mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles
cp ./scripts/profile/travis_test.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/

echo `ls ./scripts/certs`
echo `ls ./scripts/profile`
echo `ls ~/Library/MobileDevice/Provisioning\ Profiles/`