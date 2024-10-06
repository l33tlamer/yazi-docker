FROM alpine:3.20.2
ENV LD_PRELOAD=/lib/libmimalloc.so
ENV MIMALLOC_LARGE_OS_PAGES=1

USER root

RUN set -ex; \
      apk --no-cache --update add \
        wget \
        tzdata \
        curl \
        nano \
        shadow; \
      apk add yazi --repository=https://dl-cdn.alpinelinux.org/alpine/edge/testing; \
      apk --no-cache --update upgrade;

RUN set -ex; \
      ln -s /lib/libmimalloc.so.* /lib/libmimalloc.so || echo "libmimalloc.so linked"

CMD ["yazi"]
