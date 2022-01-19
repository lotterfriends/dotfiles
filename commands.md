# Commands

enable wireguard vpn

```bash
wg-quick up /etc/wireguard/anta.conf
```

get enabled services

```bash
systemctl list-unit-files | grep enabled
```

start google-chrome or Edge with fake webcam

```bash
google-chrome --use-fake-device-for-media-stream --use-file-for-fake-video-capture=/home/andre/Videos/small.mjpeg
microsoft-edge --use-fake-device-for-media-stream --use-file-for-fake-video-capture=/home/andre/Videos/testvideos/bunny.mjpeg
```


[get the video file](http://techslides.com/sample-webm-ogg-and-mp4-video-files-for-html5)
```bash
ffmpeg -i small.mp4 small.mjpeg
```

