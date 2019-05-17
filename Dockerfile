FROM alpine:latest AS build
# install dependencies packages
RUN apk add --no-cache \
  git \
  g++ \
  make
# build woff2
WORKDIR /src
RUN set -xe && \
  git clone --recursive https://github.com/google/woff2.git && \
  cd woff2 && \
  make clean all
# production
FROM alpine:latest
RUN apk add --no-cache \
  libgcc \
  libstdc++
COPY --from=build /src/woff2/woff2_* /usr/share/woff2/
RUN ln -s /usr/share/woff2/* /usr/bin/
WORKDIR /fonts
