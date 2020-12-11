FROM golang:1.10.0
LABEL maintainer "gungfu Community <dev@v2gungfu.org>"

WORKDIR /go/src/app

COPY v2gungfu ./v2gungfu

RUN set -ex \
	&& chmod +x ./v2gungfu

CMD [ "./v2gungfu" ]
