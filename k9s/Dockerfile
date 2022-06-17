FROM alpine AS builder

WORKDIR /workdir

RUN apk add --update --no-cache curl jq

RUN curl -L $(curl -s https://api.github.com/repos/derailed/k9s/releases/latest | jq -r '.assets[] | select(.name|endswith("Linux_x86_64.tar.gz")).browser_download_url') -o k9s.tar.gz
RUN tar xfz k9s.tar.gz
RUN ls -lah
RUN chown root:root k9s
RUN chmod 0755 k9s

FROM scratch

COPY --from=builder /workdir/k9s /usr/local/bin/k9s
