FROM node:lts-alpine@sha256:1b2479dd35a99687d6638f5976fd235e26c5b37e8122f786fcd5fe231d63de5b

COPY package.json package-lock.json /
RUN npm ci --omit=dev

COPY entrypoint.sh /entrypoint.sh
COPY markdownlint-problem-matcher.json /markdownlint-problem-matcher.json
ENTRYPOINT ["/entrypoint.sh"]
