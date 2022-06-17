FROM alpine AS builder

WORKDIR /workdir

RUN apk add --update --no-cache curl jq

RUN curl -L $(curl -s https://api.github.com/repos/mozilla/sops/releases/latest | jq -r '.assets[] | select(.name|endswith("linux")).browser_download_url') -o sops
RUN chown root:root sops
RUN chmod 0755 sops

FROM scratch

COPY --from=builder /workdir/sops /usr/local/bin/sops
