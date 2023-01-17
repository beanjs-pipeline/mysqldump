FROM alpine:latest

WORKDIR /home/mysql-client

RUN echo -e http://mirrors.ustc.edu.cn/alpine/v3.12/main/ > /etc/apk/repositories && \
    apk add --update mysql-client bash openssh-client && rm -rf /var/cache/apk/*

ADD . .
RUN chmod +x ./dump.sh

ENTRYPOINT [ "./dump.sh" ]