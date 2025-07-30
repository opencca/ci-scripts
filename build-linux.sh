#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

#
# XXX: This runs inside opencca-build environment
#
PRE_RUN_DIR=$PWD
cd $SCRIPT_DIR

# XXX: /opencca in container
PROJECT_ROOT=/opencca
SNAPSHOT_DIR=$PROJECT_ROOT/snapshot
BUILD_DIR=$PROJECT_ROOT/opencca-build
DEBIAN_OUT=$SNAPSHOT_DIR/debian
VERSION=-opencca-snapshot-$(date +%Y%m%d)

cd $BUILD_DIR/buildconf

./linux.mk kernel LOCALVERSION=$VERSION
./linux.mk debian DEBIAN_RELEASE_DIR=$DEBIAN_OUT LOCALVERSION=$VERSION

echo "snapshots:"
ls -al $SNAPSHOT_DIR


echo "debian packages:"
ls -al $DEBIAN_OUT



