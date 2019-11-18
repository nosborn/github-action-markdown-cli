#!/bin/sh

MARKDOWNLINT=markdownlint
# shellcheck disable=SC2016
MARKDOWNLINT="${MARKDOWNLINT}${INPUT_CONFIG_FILE:+ -c ${INPUT_CONFIG_FILE}}"
# shellcheck disable=SC2016
MARKDOWNLINT="${MARKDOWNLINT}${INPUT_IGNORE_FILES:+ -i ${INPUT_IGNORE_FILES}}"
# shellcheck disable=SC2016
MARKDOWNLINT="${MARKDOWNLINT}${INPUT_RULES:+ -r ${INPUT_RULES}}"

# shellcheck disable=SC2086
OUTPUT=$(${MARKDOWNLINT} ${INPUT_FILES} 2>&1)
SUCCESS=$?
echo "${OUTPUT}"

if [ ${SUCCESS} -eq 0 ]; then
  exit 0
fi

if [ "${GITHUB_EVENT_NAME}" = pull_request ]; then
  comment=""
  FILES=$(echo "${OUTPUT}" | cut -d: -f1 | sort | uniq)

  for file in ${FILES}; do
    comment="${comment}<details><summary><code>${file}</code></summary>

\`\`\`
$(echo "${OUTPUT}" | grep "^${file}:" | sed "s/^[^:]*:[[:space:]]*//")
\`\`\`

</details>"
  done

  COMMENT_BODY="#### Issues with Markdown/CommonMark files
${comment}

*Workflow: \`${GITHUB_WORKFLOW}\`, Action: \`${GITHUB_ACTION}\`*"
  PAYLOAD=$(echo '{}' | jq --arg body "${COMMENT_BODY}" '.body = $body')
  COMMENTS_URL=$(jq -r .pull_request.comments_url <"${GITHUB_EVENT_PATH}")

  curl -sS \
    -H "Authorization: token ${GITHUB_TOKEN}" \
    -H 'Content-Type: application/json' \
    -d "${PAYLOAD}" \
    "${COMMENTS_URL}" >/dev/null
fi

exit ${SUCCESS}
