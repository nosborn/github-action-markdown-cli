FROM node:lts-alpine@sha256:41e4389f3d988d2ed55392df4db1420ad048ae53324a8e2b7c6d19508288107e

COPY package.json package-lock.json /
RUN npm ci --omit=dev

COPY entrypoint.sh /entrypoint.sh
COPY markdownlint-problem-matcher.json /markdownlint-problem-matcher.json
ENTRYPOINT ["/entrypoint.sh"]
