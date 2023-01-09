FROM ubuntu:20.04
RUN apt update && apt install --yes software-properties-common 
RUN add-apt-repository ppa:feignint/dosbox-staging && \
    apt update && \
    apt install --yes dosbox-staging gettext

RUN mkdir -p /app/quake
COPY quake/ /app/quake

ENV SDL_VIDEODRIVER=dummy
ENV IPX_SERVER_ADDRESS=192.168.0.161
ENV IPX_SERVER_PORT=10000
ENV QUAKE_SERVER_NAME="DEFAULT SERVER" 

COPY dosbox-staging.conf.templ /app/dosbox-staging.conf.templ
COPY quake-config.cfg.templ /app/quake-config.cfg.templ
COPY start.sh /app/start.sh
RUN chmod 777 /app/start.sh

CMD /app/start.sh