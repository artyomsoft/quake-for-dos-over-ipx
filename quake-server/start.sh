#! /bin/sh
echo "**************************"
echo "*  STARTING QUAKE SERVER *"
echo "**************************"
echo ""
sleep 10
envsubst < /app/dosbox-staging.conf.templ > /app/dosbox-staging.conf
envsubst < /app/quake-config.cfg.templ > /app/quake/id1/config.cfg
dosbox -conf /app/dosbox-staging.conf