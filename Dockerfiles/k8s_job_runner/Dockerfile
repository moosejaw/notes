FROM debian:buster-slim AS kubectl-builder

RUN apt-get update && apt-get install -y curl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

FROM mcr.microsoft.com/azure-powershell:ubuntu-20.04

RUN mkdir -p /usr/local/bin
COPY --from=kubectl-builder /usr/local/bin/kubectl /usr/local/bin/kubectl

RUN useradd -s /usr/sbin/nologin -d /home/user -m user
RUN mkdir -p /mnt

USER user
RUN export PATH=$PATH:/usr/local/bin

WORKDIR /home/user
