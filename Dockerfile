FROM alpine:latest
RUN wget https://github.com/txthinking/brook/releases/latest/download/brook_linux_amd64 -O /usr/bin/brook; \
    chmod +x /usr/bin/brook; \
    adduser -D brook
USER brook
CMD brook wsserver --listen :$PORT --password hello
