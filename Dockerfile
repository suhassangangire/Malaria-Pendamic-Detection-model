FROM Suhas/ubuntu
MAINTAINER Suhas Sangangire <suhassangangire2601@gmail.com>

ENV USER root
ENV PASS cb0bc540-7c86-4494-a6e6-73c76cc468d9

RUN \
  apt-get update && \
  apt-get -y install \
          mysql-server-5.5 && \
  rm -rf /var/lib/apt/lists/*

COPY my.cnf /etc/mysql/my.cnf
COPY start.sh start.sh

VOLUME ["/var/lib/mysql"]

RUN rm /usr/sbin/policy-rc.d
CMD ["/start.sh"]

EXPOSE 3306