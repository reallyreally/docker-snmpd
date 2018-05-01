# really/snmpd
Docker image to provide snmpd (with nginx monitoring for librenms) in situations where it's difficult (like CoreOS)
[![](https://images.microbadger.com/badges/image/really/snmpd.svg)](https://microbadger.com/images/really/snmpd "Get your own image badge on microbadger.com") [![GitHub issues](https://img.shields.io/github/issues/reallyreally/docker-snmpd.svg?style=flat-square)](https://github.com/reallyreally/docker-snmpd/issues) [![GitHub license](https://img.shields.io/github/license/reallyreally/docker-snmpd.svg?style=flat-square)](https://github.com/reallyreally/docker-snmpd/blob/master/LICENSE)
[![Docker Pulls](https://img.shields.io/docker/pulls/really/snmpd.svg?style=flat-square)](https://hub.docker.com/r/really/snmpd/)

Quick and Dirty
---------------

Launch listening on "public" like this:
```
docker run -d -v /proc:/host_proc \
  --privileged \
  --read-only \
  -p 161:161/udp \
  --name snmpd
  really/snmpd
```

Your own snmpd.conf
-------------------

```
docker run -d -v /my/snmpd.conf:/etc/snmp/snmpd.conf \
  -v /proc:/host_proc \
  --privileged \
  --read-only \
  -p 161:161/udp \
  --name snmpd
  really/snmpd
```

Important Notes
---------------

Containers don't have access to /proc - so you must provide it per the
examples above.
snmpd has been modified to use /host_proc for your convenience.
