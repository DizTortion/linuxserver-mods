FROM alpine AS builder

WORKDIR /workdir

RUN apk add --update --no-cache curl

RUN curl -L https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl -o kubectl
RUN chown root:root kubectl
RUN chmod 0755 kubectl

RUN mkdir -p /etc/bash_completion.d && ./kubectl completion bash > /etc/bash_completion.d/kubectl

FROM scratch

COPY --from=builder /workdir/kubectl /usr/local/bin/kubectl
COPY --from=builder /etc/bash_completion.d/kubectl /etc/bash_completion.d/kubectl
