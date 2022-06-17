FROM alpine AS builder

RUN apk add --update --no-cache bash curl

RUN curl -s https://fluxcd.io/install.sh | bash

RUN mkdir -p /etc/bash_completion.d && flux completion bash > /etc/bash_completion.d/flux

FROM scratch

COPY --from=builder /usr/local/bin/flux /usr/local/bin/flux
COPY --from=builder /etc/bash_completion.d/flux /etc/bash_completion.d/flux
