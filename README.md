# really/snmpd
Docker image to provide snmpd in situations where it's difficult (like CoreOS)

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
