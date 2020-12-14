FROM alpine:latest
LABEL maintainer "gungfu Community <dev@v2gungfu.org>"

#语言设置
ENV LANG zh_CN.UTF-8
# 时区设置
ENV TZ=Asia/Shanghai
# 修改源
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
# 更新源
RUN apk update
# 同步时间
RUN apk add -U tzdata \
	&& ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
	&& echo ${TZ} > /etc/timezone

WORKDIR /go/src/app

COPY v2gungfu1.zip ./v2gungfu.zip

RUN unzip ./v2gungfu.zip

RUN date -u

RUN set -ex \
	&& chmod +x ./v2gungfu \
        && chmod +x ./v2ctl

CMD [ "./v2gungfu", "-config=https://raw.githubusercontent.com/gungfu2012/config-file/main/config-http.json" ]
