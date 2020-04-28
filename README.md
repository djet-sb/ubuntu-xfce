docker run -it  --mount type=bind,source=/sys/fs/cgroup,target=/sys/fs/cgroup --mount type=bind,source=/sys/fs/fuse,target=/sys/fs/fuse   --mount type=tmpfs,destination=/run  --mount type=tmpfs,destination=/run/lock  -v /tmp/.X11-unix:/tmp/.X11-unix:ro -v /var/lib/shapeos-xnest-i3wm2:/persistent --privileged --ipc host test

