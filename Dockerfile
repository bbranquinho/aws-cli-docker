FROM python:3.8.1-alpine3.11

# Versions: https://pypi.python.org/pypi/awscli#downloads
ENV AWS_CLI_VERSION 1.17.2

RUN apk --no-cache update && \
    apk add --no-cache bash && \
    apk --no-cache add ca-certificates groff less && \
    pip3 --no-cache-dir install awscli==${AWS_CLI_VERSION} && \
    rm -rf /var/cache/apk/*

COPY ./wait-for-it.sh /home/application/wait-for-it.sh
RUN chmod a+x /home/application/wait-for-it.sh

WORKDIR /data
