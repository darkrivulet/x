FROM debian:latest

COPY xray /usr/bin/xray
COPY geoip.dat /usr/bin/geoip.dat
COPY geosite.dat /usr/bin/geosite.dat

RUN chmod +x /usr/bin/xray; \
    useradd -m xray

USER xray

COPY config.json /home/xray/config.json

CMD sh -c "sed -i 's/PORT/'$PORT'/g' /home/xray/config.json | xray run -c /home/xray/config.json"
