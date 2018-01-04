#!/bin/bash

# Forked from Zeste de Savoir:
# https://github.com/zestedesavoir/zds-site/blob/a16c5fc932b361cbee5c6e61b24167605e24cd8b/scripts/install_texlive.sh

EXTRA_PACKAGES="adjustbox blindtext capt-of catoptions cm-super collectbox framed fvextra glossaries ifplatform menukeys minted multirow ntheorem pagecolor relsize tabu varwidth xpatch xstring mfirstuc xfor datatool substr tracklang xsavebox media9 tcolorbox environ etoolbox trimspaces ifthen geometry xifthen ifmtarg fontspec luacode ctablestack"
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
  echo $EXTRA_PACKAGES > $EXTRA_PACKAGES_CACHE
  
  echo "Installation complete !"
}

if [[ -f $HOME/.texlive/bin/x86_64-linux/tlmgr ]]; then
  if [[ -f $EXTRA_PACKAGES_CACHE ]]; then
      CACHE_CONTENT=$(cat $EXTRA_PACKAGES_CACHE)
      echo $CACHE_CONTENT
      if [[ "$CACHE_CONTENT" -ne "$EXTRA_PACKAGES" ]]; then
        install_texlive
      else
        echo "using cached texlive"
      fi
  else
    install_texlive
  fi
else
  install_texlive
fi

# Symlink the binaries to ~/bin
for i in $HOME/.texlive/bin/x86_64-linux/*; do
  ln -sf $i $HOME/bin/
done
