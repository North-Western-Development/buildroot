#!/bin/sh
ver=$(curl -s 'https://api.github.com/repos/${{ github.repository }}/tags' | jq -r '.[1].name') # get the second latest release number
if [ "$ver" != "null" ] && wget 'https://github.com/${{ github.repository }}'/releases/download/"$ver"/cache.tar.zst; then
    tar -C ~ -xf cache.tar.zst
    mv ~/dl .
fi
