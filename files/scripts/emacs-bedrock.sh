#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

# Download emacs-bedrock as a tarball
curl -L https://codeberg.org/ashton314/emacs-bedrock/archive/master.tar.gz -o /tmp/bedrock.tar.gz

# Extract
mkdir -p /tmp/emacs-bedrock
tar -xzf /tmp/bedrock.tar.gz -C /tmp/emacs-bedrock --strip-components=1

# Install into /etc/skel so new users get the config
mkdir -p /etc/skel/.emacs.d
cp /tmp/emacs-bedrock/early-init.el /etc/skel/.emacs.d/
cp /tmp/emacs-bedrock/init.el /etc/skel/.emacs.d/
cp -r /tmp/emacs-bedrock/extras /etc/skel/.emacs.d/

# Clean up
rm -rf /tmp/emacs-bedrock /tmp/bedrock.tar.gz
