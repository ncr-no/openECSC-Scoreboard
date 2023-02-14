FROM mcr.microsoft.com/vscode/devcontainers/javascript-node:latest
ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=Europe/Oslo

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get upgrade -y

RUN DEBIAN_FRONTEND=noninteractive apt-get install git 

RUN mkdir /opt/dashboard_api

RUN git clone -b develop --single-branch https://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@github.com/ncr-no/CTF-Scoreboard-API.git /opt/dashboard_api

WORKDIR /opt/dashboard_api

RUN npm install -ci

CMD ["node","app.js"]