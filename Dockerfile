FROM ubuntu:19.10
ENV DEBIAN_FRONTEND noninteractive
ENV DISPLAY :10
ENV container docker  
ENV DBUS_SERSSION_BUS_ADDRESS=unix path=/var/run/dbus/system_bus_socket
RUN apt-get update; apt-get -y install --no-install-recommends  \
       xfce4 \
       xfce4-terminal \
       xserver-xephyr \
       pavucontrol \
       pulseaudio \
       sudo \
       vim \
       zsh  
RUN apt-get -y install  dbus-x11
#Personal
RUN apt-get -y install wget sassc git
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
     && apt-get install -y ./google-chrome-stable_current_amd64.deb \
     && rm google-chrome-stable_current_amd64.deb
RUN git clone https://github.com/nana-4/materia-theme.git \
     && cd materia-theme \
     && ./install.sh \
     && cd .. \
     && rm -rf materia-theme

COPY root/ /
RUN ln -sf /etc/systemd/system/container.target /etc/systemd/system/default.target \
    && systemctl enable  \
       init-persistent.service \
       init-user.service \
       dbus-launch.service \
       xephyr.service \
       pulseaudio.service \
       dbus-deamon.service \
       xfce4-session.service 
ENTRYPOINT ["/sbin/init"]
CMD ["--log-level=info"]
STOPSIGNAL SIGRTMIN+3
