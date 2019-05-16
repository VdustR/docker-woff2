# Docker woff2

A dockerized [woff2](https://github.com/google/woff2) image.

Execute:

```bash
docker run -it --rm -v $(pwd):/fonts vdustr/woff2 woff2_compress myfont.ttf
docker run -it --rm -v $(pwd):/fonts vdustr/woff2 woff2_decompress myfont.woff2
```

Build image:

```bash
docker build -t vdustr/woff2 .
```
