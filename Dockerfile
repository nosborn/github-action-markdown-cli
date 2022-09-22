FROM node:lts-alpine

RUN npm install --global --production --update-notifier=false markdownlint-cli@0.32.2

COPY entrypoint.sh /entrypoint.sh
COPY markdownlint-problem-matcher.json /markdownlint-problem-matcher.json
ENTRYPOINT ["/entrypoint.sh"]
