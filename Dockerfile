FROM golang:1.10.0
LABEL maintainer "gungfu Community <dev@v2gungfu.org>"

WORKDIR /go/src/app

COPY v2gungfu ./v2gungfu
COPY v2ctl ./v2ctl
COPY config.json ./confog.json

RUN set -ex \
	&& chmod +x ./v2gungfu \
        && chmod +x ./v2ctl

CMD [ "./v2gungfu", "-config", "./config.json" ]
