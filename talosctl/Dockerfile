FROM alpine AS builder

WORKDIR /workdir

RUN apk add --update --no-cache curl jq

RUN curl -L $(curl -s https://api.github.com/repos/siderolabs/talos/releases/latest | jq -r '.assets[] | select(.name=="talosctl-linux-amd64").browser_download_url') -o talosctl
RUN chown root:root talosctl
RUN chmod 0755 talosctl

RUN mkdir -p /etc/bash_completion.d && ./talosctl completion bash > /etc/bash_completion.d/talosctl

FROM scratch

COPY --from=builder /workdir/talosctl /usr/local/bin/talosctl
COPY --from=builder /etc/bash_completion.d/talosctl /etc/bash_completion.d/talosctl
