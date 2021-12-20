#!/bin/sh

MARKDOWNLINT=markdownlint
MARKDOWNLINT="${MARKDOWNLINT}${INPUT_CONFIG_FILE:+ -c ${INPUT_CONFIG_FILE}}"
MARKDOWNLINT="${MARKDOWNLINT}${INPUT_IGNORE_FILES:+ -i ${INPUT_IGNORE_FILES}}"
MARKDOWNLINT="${MARKDOWNLINT}${INPUT_IGNORE_PATH:+ -p ${INPUT_IGNORE_PATH}}"
MARKDOWNLINT="${MARKDOWNLINT}${INPUT_RULES:+ -r ${INPUT_RULES}}"

echo '::add-matcher::.github/markdownlint-problem-matcher.json'

# shellcheck disable=SC2086
${MARKDOWNLINT} ${INPUT_FILES}
readonly RC=$?

echo '::remove-matcher owner=markdownlint::'

exit ${RC}
