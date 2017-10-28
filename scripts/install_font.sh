#!/usr/bin/env bash

set -e

# Configure font folder
FONT_DIR="${HOME}/.local/share/fonts"
mkdir -p ${FONT_DIR}
cd ${FONT_DIR}

function Download_Font {
    if [ $# -eq 1 ]
    then
        mkdir ${1}
        cd ${1}

        wget -qO "${1}.zip" https://www.fontsquirrel.com/fonts/download/${1}
        unzip ${1}.zip
        rm -rf ${1}.zip

        cd ..
    fi
}

# Download Merriweather font

Download_Font merriweather

# Download Source Sans Pro

Download_Font source-sans-pro

# Download Source Code Pro

Download_Font source-code-pro

# Update cache
fc-cache -frv
