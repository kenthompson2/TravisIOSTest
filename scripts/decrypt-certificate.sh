#!/bin/sh

# $1 - ENCRYPTION_SECRET $2 - PROFILE_NAME $3 - CERT_NAME

echo "decrypting...."

openssl aes-256-cbc -k "$KEY_PASSWORD" -in "scripts/profile/travis_test.mobileprovision.enc" -d -a -out "scripts/profile/travis_test.mobileprovision"
openssl aes-256-cbc -k "$KEY_PASSWORD" -in "scripts/certs/dist.cer.enc" -d -a -out "scripts/certs/dist.cer"
openssl aes-256-cbc -k "$KEY_PASSWORD" -in "scripts/certs/dist.p12.enc" -d -a -out "scripts/certs/dist.p12"

echo `ls scripts/profile -la`
echo `ls scripts/certs -la`
