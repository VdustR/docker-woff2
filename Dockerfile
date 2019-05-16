FROM alpine:latest AS build
# install dependencies packages
RUN apk update
RUN apk add --no-cache \
  bash \
  cmake \
  git \
  g++ \
  make
# install brotli
WORKDIR /
RUN git clone https://github.com/google/brotli.git
WORKDIR /brotli/out
RUN ../configure-cmake
RUN make
RUN make test
RUN make install
WORKDIR /
RUN rm -rf brotli
# install woff2
WORKDIR /
RUN git clone --recursive https://github.com/google/woff2.git
WORKDIR /woff2
RUN make clean all
WORKDIR /woff2/out
RUN cmake -DBUILD_SHARED_LIBS=OFF ..
RUN make
RUN make install
WORKDIR /usr/share/woff
RUN cp /woff2/out/woff2_* .
RUN ln -s /usr/share/woff/* /usr/bin/
WORKDIR /
RUN rm -rf woff2
# entry point
WORKDIR /fonts
