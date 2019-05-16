# Docker woff2

A dockerized [woff2](https://github.com/google/woff2) image.

Build image:

```bash
docker build -t woff2 .
```

Execute

```bash
docker run -it --rm -v $(pwd):/fonts woff2 woff2_compress myfont.ttf
docker run -it --rm -v $(pwd):/fonts woff2 woff2_decompress myfont.woff2
```
