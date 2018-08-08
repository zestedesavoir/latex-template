#!/bin/bash

# Forked from Zeste de Savoir:
# https://github.com/zestedesavoir/zds-site/blob/a16c5fc932b361cbee5c6e61b24167605e24cd8b/scripts/install_texlive.sh

EXTRA_PACKAGES=$(cat $(dirname "$0")/packages)
EXTRA_PACKAGES_CACHE="$HOME/.texlive/extra_packages_cache.txt"

function install_texlive() {
  # Force cache upload after successful build
  touch $HOME/.cache_updated
  echo "Installing texlive to \$HOME/.texlive"
  rm -rf $HOME/.texlive
  TEXLIVE_PROFILE=${BASH_SOURCE[0]/%install_texlive.sh/texlive.profile}

  # Create install dir
  mkdir -p $HOME/.texlive/
  cp $TEXLIVE_PROFILE $HOME/.texlive/
  cd $HOME/.texlive/

  # Fix paths in profile (needs absolute paths)
  sed -i 's@\$HOME@'"$HOME"'@' texlive.profile

  # Download and run installer
  wget -O install-tl.tar.gz http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
  tar xzf install-tl.tar.gz

  ./install-tl*/install-tl -profile texlive.profile

  # Install extra latex packages
  $HOME/.texlive/bin/x86_64-linux/tlmgr install $EXTRA_PACKAGES
  $HOME/.texlive/bin/x86_64-linux/tlmgr update --self
  
  # save list of extra packages
  printf "$EXTRA_PACKAGES" > $EXTRA_PACKAGES_CACHE
  
  echo "Installation complete !"
}

if [[ -f $HOME/.texlive/bin/x86_64-linux/tlmgr ]]; then
  if [[ -f $EXTRA_PACKAGES_CACHE ]]; then
      echo "<$(cat $EXTRA_PACKAGES_CACHE)> <$EXTRA_PACKAGES>"
      if [[ $(cat $EXTRA_PACKAGES_CACHE) != $EXTRA_PACKAGES ]]; then
        echo "! found change in extra packages"
        install_texlive
      else
        echo "! no change detected: using cached texlive"
      fi
  else
    echo "! extra packages cache not found in $EXTRA_PACKAGES_CACHE"
    install_texlive
  fi
else
  echo "! previous installation not found"
  install_texlive
fi
