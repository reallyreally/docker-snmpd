FROM alpine:latest

MAINTAINER Troy Kelly <troy.kelly@really.ai>

EXPOSE 161 161/udp

RUN apk add --update --no-cache linux-headers alpine-sdk curl findutils sed && \
  mkdir -p /etc/snmp && \
  curl -L "https://sourceforge.net/projects/net-snmp/files/5.4.5-pre-releases/net-snmp-5.4.5.rc1.tar.gz/download" -o net-snmp.tgz && \
  tar zxvf net-snmp.tgz && \
  cd net-snmp-* && \
  find . -type f -print0 | xargs -0 sed -i 's/\"\/proc/\"\/host_proc/g' && \
  ./configure --prefix=/usr/local --disable-ipv6 --disable-snmpv1 --with-defaults && \
  make && \
  make install && \
  cd .. && \
  rm -Rf ./net-snmp* && \
  apk del linux-headers alpine-sdk curl findutils sed

COPY snmpd.conf /etc/snmp

CMD [ "/usr/local/sbin/snmpd", "-f", "-c", "/etc/snmp/snmpd.conf" ]
