FROM debian:stretch-slim
RUN apt-get update
RUN apt-get install -y dovecot-imapd
RUN apt-get install -y postfix
RUN apt-get install -y bind9
RUN apt-get install -y curl
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN groupadd -g 2000 nicmaild && adduser --uid 2000 --gid 2000 --disabled-password --gecos "" nicmaild
USER nicmaild
ENV NVM_DIR /home/nicmaild/nvm
ENV NODE_VERSION 11.3.0
RUN mkdir $NVM_DIR
RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \

# Paths!
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# confirm installation
RUN node -v
RUN npm -v

