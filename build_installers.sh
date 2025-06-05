#!/bin/bash
set -e

WORKDIR="/tmp/zeb_keepalive_pkg"
INSTALL_SCRIPTS="$WORKDIR/scripts"
UNINSTALL_SCRIPTS="$WORKDIR/uninstall_scripts"
INSTALL_PAYLOAD="$WORKDIR/payload"
UNINSTALL_PAYLOAD="$WORKDIR/uninstall_payload"
PKG_ID="com.user.zebkeepalive"
UNINSTALL_PKG_ID="com.user.zebkeepalive.uninstall"
VERSION="1.0"

rm -rf "$WORKDIR"
mkdir -p "$INSTALL_SCRIPTS" "$UNINSTALL_SCRIPTS" "$INSTALL_PAYLOAD" "$UNINSTALL_PAYLOAD"

# Copy files in place
cp source/payload/* "$INSTALL_PAYLOAD/"
cp source/scripts/postinstall "$INSTALL_SCRIPTS/postinstall"
cp source/uninstall_scripts/postinstall "$UNINSTALL_SCRIPTS/postinstall"

# Build the main installer
pkgbuild --root "$INSTALL_PAYLOAD" --scripts "$INSTALL_SCRIPTS" \
 --identifier "$PKG_ID" --version "$VERSION" --install-location "/Users/Shared/zeb_keepalive" \
 /tmp/zeb_keepalive_installer.pkg

# Build the uninstaller
pkgbuild --root "$UNINSTALL_PAYLOAD" --scripts "$UNINSTALL_SCRIPTS" \
 --identifier "$UNINSTALL_PKG_ID" --version "$VERSION" --install-location "/tmp" \
 /tmp/zeb_keepalive_uninstaller.pkg

echo "✅ Installer: /tmp/zeb_keepalive_installer.pkg"
echo "✅ Uninstaller: /tmp/zeb_keepalive_uninstaller.pkg"

