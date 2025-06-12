FROM node:lts-alpine@sha256:41e4389f3d988d2ed55392df4db1420ad048ae53324a8e2b7c6d19508288107e

RUN npm install --global --omit=dev --update-notifier=false markdownlint-cli@0.43.0

COPY entrypoint.sh /entrypoint.sh
COPY markdownlint-problem-matcher.json /markdownlint-problem-matcher.json
ENTRYPOINT ["/entrypoint.sh"]
