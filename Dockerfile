FROM node:lts-alpine

RUN npm install --global --production --update-notifier=false markdownlint-cli@0.43.0

COPY entrypoint.sh /entrypoint.sh
COPY markdownlint-problem-matcher.json /markdownlint-problem-matcher.json
ENTRYPOINT ["/entrypoint.sh"]
