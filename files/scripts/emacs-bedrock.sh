#!/usr/bin/env bash
set -oue pipefail
# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!


# Clone emacs-bedrock from the repository
rm -rf /tmp/emacs-bedrock
git clone https://codeberg.org/ashton314/emacs-bedrock.git /tmp/emacs-bedrock
echo "(set-frame-parameter nil 'fullscreen 'fullboth)" >> /tmp/emacs-bedrock/init.el
cat > /tmp/.xinitrc <<'EOF'
exec emacs
EOF
# Install into /etc/skel so new users get the config
mkdir -p /etc/skel/.emacs.d

cp /tmp/emacs-bedrock/early-init.el /etc/skel/.emacs.d/
cp /tmp/emacs-bedrock/init.el /etc/skel/.emacs.d/
cp -r /tmp/emacs-bedrock/extras /etc/skel/.emacs.d/
cp /tmp/.xinitrc /etc/X11/xinit/xinitrc

# Clean up
rm -rf /tmp/emacs-bedrock
