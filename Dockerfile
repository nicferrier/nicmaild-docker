FROM debian:stretch-slim
RUN apt-get update
RUN apt-get install -y dovecot-imapd
RUN apt-get install -y postfix
RUN apt-get install -y bind9
