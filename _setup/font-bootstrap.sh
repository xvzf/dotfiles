#/bin/bash
cd $(mktemp -d)
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/IBMPlexMono.zip
unzip IBMPlexMono.zip -d ~/.fonts
fc-cache -fv
