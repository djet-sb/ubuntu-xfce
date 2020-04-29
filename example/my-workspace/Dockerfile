FROM bres/ubuntu-xfce4
#Install google-chromium
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
     && apt-get install  -y ./google-chrome-stable_current_amd64.deb gnupg \
     && apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 78BD65473CB3BD13 \ 
     && rm google-chrome-stable_current_amd64.deb
#Install telegram-desktop
RUN apt-get update; apt-get -y install --no-install-recommends telegram-desktop
#Install vscode
RUN apt-get update; apt-get -y install --no-install-recommends curl gpg  \
    && echo "deb [arch=amd64] http://packages.microsoft.com/repos/vscode stable main" | tee /etc/apt/sources.list.d/vs-code.list \
    && curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /etc/apt/trusted.gpg.d/microsoft.gpg \ 
    && apt-get update; apt-get -y install code
