FROM mcr.microsoft.com/dotnet/sdk:8.0-alpine3.18-amd64
# Alpine Packages: https://pkgs.alpinelinux.org/packages

USER root

# Install tools.
RUN apk update && \
    apk upgrade && \
	apk add --no-cache npm zip	

RUN npm config set prefix /usr/local

RUN npm install -g serverless@3.26.0
RUN npm install -g @serverless/compose@1.3.0

ENV GLIBC_VER=2.34-r0

# Install AWS CLI 2
RUN apk --no-cache add \
        binutils \
        curl \
    && curl -sL https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub -o /etc/apk/keys/sgerrand.rsa.pub \
    && curl -sLO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VER}/glibc-${GLIBC_VER}.apk \
    && curl -sLO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VER}/glibc-bin-${GLIBC_VER}.apk \
    && apk add --no-cache --force-overwrite \
        glibc-${GLIBC_VER}.apk \
        glibc-bin-${GLIBC_VER}.apk \
    && curl -sL https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip \
    && unzip awscliv2.zip \
    && aws/install \
    && rm -rf \
        awscliv2.zip \
        aws \
        /usr/local/aws-cli/v2/*/dist/aws_completer \
        /usr/local/aws-cli/v2/*/dist/awscli/data/ac.index \
        /usr/local/aws-cli/v2/*/dist/awscli/examples \
    && apk --no-cache del \
        binutils \
        curl \
    && rm glibc-${GLIBC_VER}.apk \
    && rm glibc-bin-${GLIBC_VER}.apk \
    && rm -rf /var/cache/apk/*

RUN dotnet tool install -g Amazon.Lambda.Tools --framework net8.0
RUN dotnet tool install -g dotnet-ef --framework net8.0

RUN export PATH="$PATH:/root/.dotnet/tools"
RUN export PATH="$HOME/.serverless/bin:$PATH"

RUN aws --version
RUN sls --version
