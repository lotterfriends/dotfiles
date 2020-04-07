# Commands

enable wireguard vpn

```bash
$ wg-quick up /etc/wireguard/anta.conf
```

get enabled services

```bash
$ systemctl list-unit-files | grep enabled
```

start google-chrome with fake webcam

```bash
google-chrome --use-fake-device-for-media-stream --use-file-for-fake-video-capture=/home/andre/Videos/small.mjpeg
```
