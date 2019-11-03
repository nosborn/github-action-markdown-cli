FROM node:lts-alpine

RUN npm install --global --production markdownlint-cli@0.18 \
  && apk --update --no-cache add curl=~7.64 jq=~1.6

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
