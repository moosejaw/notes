# For testing on arm systems, such as M1 Macs.
FROM debian:buster-slim AS kubectl-builder

RUN apt-get update && apt-get install -y curl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl"
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

FROM mcr.microsoft.com/azure-powershell:mariner-2-arm64

RUN mkdir /home/user
RUN echo 'user:x:100:101:user:/home/user:/opt/microsoft/powershell/7/pwsh' >> /etc/passwd
RUN echo 'user:x:101' >> /etc/group
RUN chown -R user:user /home/user

RUN mkdir -p /usr/local/bin
COPY --from=kubectl-builder /usr/local/bin/kubectl /usr/local/bin/kubectl

USER user
RUN mkdir -p /home/user/.local/share/powershell/PSReadLine
WORKDIR /home/user
