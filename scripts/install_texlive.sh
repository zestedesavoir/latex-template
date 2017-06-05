#!/bin/bash

# Forked from Zeste de Savoir:
# https://github.com/zestedesavoir/zds-site/blob/dev/scripts/install_texlive.sh

EXTRA_PACKAGES="adjustbox blindtext capt-of catoptions cm-super collectbox framed fvextra glossaries ifplatform menukeys minted multirow ntheorem relsize tabu varwidth xpatch xstring mfirstuc xfor datatool substr tracklang"

if [[ -f $HOME/.texlive/bin/x86_64-linux/tlmgr ]]; then
  echo "Using cached texlive install"
else
  # force cache upload after successful build
  touch $HOME/.cache_updated
  echo "Installing texlive to \$HOME/.texlive"
  rm -rf $HOME/.texlive
  TEXLIVE_PROFILE=${BASH_SOURCE[0]/%install_texlive.sh/texlive.profile}

  # Creating install dir
  mkdir -p $HOME/.texlive/
  cp $TEXLIVE_PROFILE $HOME/.texlive/
  cd $HOME/.texlive/

  # Replace correct paths in profile (needs absolute paths)
  sed -i 's@\$HOME@'"$HOME"'@' texlive.profile

  # Download and run installer
  wget -O install-tl.tar.gz ftp://tug.org/historic/systems/texlive/2017/install-tl-unx.tar.gz
  tar xzf install-tl.tar.gz

  ./install-tl*/install-tl -profile texlive.profile

  echo "Installation complete !"
fi


# Install extra latex packages
$HOME/.texlive/bin/x86_64-linux/tlmgr update --self
$HOME/.texlive/bin/x86_64-linux/tlmgr install $EXTRA_PACKAGES
$HOME/.texlive/bin/x86_64-linux/tlmgr update --self

# Symlink the binaries to ~/bin
for i in $HOME/.texlive/bin/x86_64-linux/*; do
  ln -sf $i $HOME/bin/
done
