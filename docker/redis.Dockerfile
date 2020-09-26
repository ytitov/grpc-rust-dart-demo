FROM redis:5.0.7-alpine
RUN apk update && apk add netcat-openbsd bash
COPY ./redis.conf /usr/local/etc/redis/redis.conf
#CMD [ "/bin/bash", "redis-server /usr/local/etc/redis/redis.conf" ]
CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]
