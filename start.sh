#!/bin/bash

echo "Starting Evernote"
echo "Wine version"
wine --version

WINEDLLOVERRIDES="mshtml,mscoree=" wineboot -u
# Install theme, config screen resolution...
echo "Configure wine!"
winecfg

echo "Configuring font smoothing for wine..."
/bin/bash /evernote/winefontsmothing_en.sh
chmod +x /evernote/winefontsmothing_en.sh
/evernote/winefontsmothing_en.sh

echo "Starting wine..."
# wine /usr/src/evernote.exe
wine /usr/src/evernote.exe &
echo "Evernote is running..."

while(true)
do
    echo "Evernote is running"
    sleep 600
done
