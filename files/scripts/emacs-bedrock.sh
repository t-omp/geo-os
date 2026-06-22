#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

# Clone emacs-bedrock from the repository
rm -rf /tmp/emacs-bedrock
git clone https://codeberg.org/ashton314/emacs-bedrock.git /tmp/emacs-bedrock

# Install into /etc/skel so new users get the config
mkdir -p /etc/skel/.emacs.d
cp /tmp/emacs-bedrock/early-init.el /etc/skel/.emacs.d/
cp /tmp/emacs-bedrock/init.el /etc/skel/.emacs.d/
cp -r /tmp/emacs-bedrock/extras /etc/skel/.emacs.d/

# Clean up
rm -rf /tmp/emacs-bedrock
