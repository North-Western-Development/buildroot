#!/bin/sh
if [ -z "$GITHUB_REPOSITORY" ]; then
    printf 'This should only be run as part of a GitHub actions workflow.\n'
    exit 1
fi

ver=$(curl -s "https://api.github.com/repos/$GITHUB_REPOSITORY/tags" | jq -r '.[1].name') # get the second latest release number
if [ "$ver" != "null" ] && wget "https://github.com/$GITHUB_REPOSITORY/releases/download/$ver/cache.tar.zst"; then
    tar -C ~ -xf cache.tar.zst
    mv ~/dl .
fi
