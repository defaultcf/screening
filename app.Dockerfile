FROM ruby:2.5.5-alpine3.9
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/v3.5/main' >> /etc/apk/repositories
RUN apk update && apk add --no-cache alpine-sdk ruby-dev postgresql-dev nodejs npm tzdata imagemagick=6.9.6.8-r1 imagemagick-dev=6.9.6.8-r1 openssh python linux-headers xz-libs
RUN gem install bundler:2.0.1 && npm i -g yarn
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
WORKDIR /app
EXPOSE 3000
CMD ["rails", "server"]
