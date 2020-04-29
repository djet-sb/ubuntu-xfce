```
docker build -t bres/ubuntu-xfce4 .
```

```
docker run -d \
  --mount type=bind,source=/sys/fs/cgroup,target=/sys/fs/cgroup\
  --mount type=bind,source=/dev,target=/dev\
  --mount type=bind,source=/sys/fs/fuse,target=/sys/fs/fus
  --mount type=tmpfs,destination=/run\
  --mount type=tmpfs,destination=/run/lock\
  -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
  -e FULLSCREEN=true \
  --privileged \
  --ipc host \
  bres/ubuntu-xfce4
```

