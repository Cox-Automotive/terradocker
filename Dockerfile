FROM ubuntu
MAINTAINER Brian Antonelli

ENV TERRAFORM_VERSION=0.11.11
ENV TF_ALKS_PROVIDER_VERSION=1.2.1
ENV TERRAGRUNT_VERSION=v0.13.23

RUN apt-get update && \
    apt-get install -y \
        ca-certificates \
        wget \
        curl \
        unzip

RUN mkdir /work
VOLUME [ "/work" ]
WORKDIR "/work"

RUN wget -q -O /tmp/terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip /tmp/terraform.zip -d /usr/bin && \
    rm -rf /tmp/terraform.zip && \
    wget -q -O /tmp/tfalks.tar.gz https://github.com/Cox-Automotive/terraform-provider-alks/releases/download/${TF_ALKS_PROVIDER_VERSION}/terraform-provider-alks-linux-amd64.tar.gz && \
    mkdir -p ~/.terraform.d/plugins/ && \
    tar -zxvf /tmp/tfalks.tar.gz -C ~/.terraform.d/plugins/ && \
    rm /tmp/tfalks.tar.gz && \
    chmod a+x ~/.terraform.d/plugins/terraform-provider-alks* && \
    wget -q -O /bin/terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 && \
    chmod +x /bin/terragrunt

ENTRYPOINT ["terraform"]
CMD ["version"]
