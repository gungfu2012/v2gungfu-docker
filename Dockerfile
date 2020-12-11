FROM golang:latest
LABEL maintainer "V2Fly Community <dev@v2fly.org>"

WORKDIR /go/src/app

COPY v2gungfu ./v2gungfu

RUN set -ex \
	&& chmod +x ./v2gungfu

CMD [ "./v2gungfu" ]
