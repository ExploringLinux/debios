#!/bin/bash

mkdir -p $HOME/.nvm && \
    cd $HOME && \
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash \
        && . .nvm/nvm.sh \
        nvm install 14 && \
        nvm install 16 && \
        nvm install 18 && \
        nvm install 20 && \
        nvm use 16 && \
        nvm alias default 16 && \
        && ln -s `npm bin --global` $HOME/.node-bin

echo "" >> $HOME/.bashrc && \
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bashrc && \
echo '[ -s "~/.nvm/nvm.sh" ] && . "~/.nvm/nvm.sh"  # This loads nvm' >> ~/.bashrc

echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc && \
echo '[ -s "$HOME/.nvm/nvm.sh" ] && . "$HOME/.nvm/nvm.sh"  # This loads nvm' >> ~/.zshrc

find ~/.nvm -type f -name node -exec ln -s {} /usr/local/bin/node \; && \
NODE_MODS_DIR="~/.nvm/versions/node/$(node -v)/lib/node_modules" && \
ln -s $NODE_MODS_DIR/npm/bin/npm-cli.js /usr/local/bin/npm && \
ln -s $NODE_MODS_DIR/npm/bin/npx-cli.js /usr/local/bin/npx && \

###########################################################################
# YARN:
###########################################################################

if [ -s "$HOME/.nvm/nvm.sh" ] && . "$HOME/.nvm/nvm.sh" && \
        curl -o- -L https://yarnpkg.com/install.sh | bash; \
    echo "" >> $HOME/.bashrc && \
    echo 'export PATH="$HOME/.yarn/bin:$PATH"' >> ~/.bashrc

    echo "" >> $HOME/.zshrc && \
    echo 'export PATH="$HOME/.yarn/bin:$PATH"' >> ~/.zshrc

fi;