FROM ubuntu:19.10
ENV DEBIAN_FRONTEND noninteractive
ENV DISPLAY :10
ENV container docker  
RUN apt-get update; apt-get -y install --no-install-recommends  \
       xfce4 \
       xfce4-terminal \
       xserver-xephyr \
       zsh  
RUN apt-get -y install  dbus-x11
COPY root/ /

RUN ln -sf /etc/systemd/system/container.target /etc/systemd/system/default.target \
    && systemctl enable init-persistent.service init-user.service dbus-launch.service xephyr.service xfce4-session.service 
ENTRYPOINT ["/sbin/init"]

CMD ["--log-level=info"]

STOPSIGNAL SIGRTMIN+3
