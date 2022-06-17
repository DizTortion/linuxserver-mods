FROM alpine AS builder

WORKDIR /workdir

RUN apk add --update --no-cache curl jq

RUN curl -L $(curl -s https://api.github.com/repos/filosottile/age/releases/latest | jq -r '.assets[] | select(.name|endswith("linux-amd64.tar.gz")).browser_download_url') -o age.tar.gz
RUN tar xfz age.tar.gz --strip-components=1

RUN chown root:root age
RUN chown root:root age-keygen
RUN chmod 0755 age
RUN chmod 0755 age-keygen

FROM scratch

COPY --from=builder /workdir/age /usr/local/bin/age
COPY --from=builder /workdir/age-keygen /usr/local/bin/age-keygen
