FROM alpine:3.7
RUN apk add --no-cache ruby ruby-bundler
RUN gem install mustache --no-ri --no-rdoc
RUN mkdir -p /usr/share/base/
WORKDIR  /usr/share/base/
