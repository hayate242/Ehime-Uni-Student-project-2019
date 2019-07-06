FROM jrottenberg/ffmpeg

RUN mkdir /data

COPY ./etc/broadcast.sh /etc/broadcast.sh

ENTRYPOINT ["/etc/broadcast.sh"]
