# Commands

enable wireguard vpn

```bash
$ wg-quick up /etc/wireguard/anta.conf
```

get enabled services

```
$ systemctl list-unit-files | grep enabled
```
