FROM alpine:latest
LABEL maintainer "gungfu Community <dev@v2gungfu.org>"

WORKDIR /go/src/app

COPY v2gungfu1.zip ./v2gungfu.zip

RUN unzip ./v2gungfu.zip

RUN date -u

RUN set -ex \
	&& chmod +x ./v2gungfu \
        && chmod +x ./v2ctl

CMD [ "./v2gungfu", "-config", "./config.json" ]
