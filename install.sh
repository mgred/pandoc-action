#!/bin/sh

case "$RUNNER_OS"
  Linux | Windows)
    OS=$(echo $RUNNER_OS | tr '[[:upper:]]' '[[:lower]]');;
  macos)
    OS=$RUNNER_OS;;
esac

VERSION=2.7.3
FILE="pandoc-$VERSION-$OS.tar.gz"
CACHED_FILE="$RUNNER_TOOL_CACHE/$FILE" 
SRC_PATH="https://github.com/jgm/pandoc/releases/download/$VERSION"
DIST_PATH=/usr/local

echo "Install pandoc $VERSION on $RUNNER_OS"

echo "Download $SRC_PATH/$FILE to $CACHED_FILE"

curl -L -o "$CACHED_FILE" "$SRC_PATH/$FILE"

echo "Extracting $CACHED_FILE to $DIST_PATH"

sudo tar xvzf "$CACHED_FILE" --strip-components 1 -C "$DIST_PATH"

echo "Use pandoc"

pandoc --help
