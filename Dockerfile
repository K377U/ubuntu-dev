FROM ubuntu:18.04

MAINTAINER  "Roope Tikkanen" <roope@k377u.com>
ENV DEBIAN_FRONTEND noninteractive
ENV TZ="Europe/Helsinki"

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN \
  apt-get update && \
  apt-get -y dist-upgrade && \
  apt-get install -y --no-install-recommends apt-utils && \ 
  apt-get install -y build-essential openssh-client libsasl2-dev libldap2-dev libssl-dev libffi-dev libcurl4-openssl-dev python-dev build-essential openssh-client libsasl2-dev libldap2-dev libssl-dev libffi-dev libcurl4-openssl-dev bc git wget curl hunspell zlib1g-dev libbz2-dev liblzma-dev libncurses5-dev dh-autoreconf pkg-config autoconf gettext zlib1g-dev libtiff5-dev libjpeg8-dev libfreetype6-dev liblcms2-dev libwebp-dev graphviz-dev libcairo2 libpango-1.0-0 libpangocairo-1.0-0 libgdk-pixbuf2.0-0 shared-mime-info jq python-dev python-virtualenv python-pip python-pip-whl python-six python3.6 python3.6-dev python3.6-venv python3-tk python3-six python3-cffi libpq-dev && \
  apt-get clean && \
  ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
  echo $TZ > /etc/timezone && \
  dpkg-reconfigure -f noninteractive tzdata && \
  pip install --upgrade pip virtualenv && \
  apt-get autoremove -y && \
  apt-get autoclean -y && \
  rm -rf /var/lib/apt/lists/*

ENV DEBIAN_FRONTEND teletype

CMD ["bash"]

