#!/bin/sh

: "${INPUT_CONFIG:=${INPUT_CONFIG_FILE:-}}"

MARKDOWNLINT=markdownlint
MARKDOWNLINT="${MARKDOWNLINT}${INPUT_CONFIG:+ -c ${INPUT_CONFIG}}"
MARKDOWNLINT="${MARKDOWNLINT}${INPUT_IGNORE_FILES:+ -i ${INPUT_IGNORE_FILES}}"
MARKDOWNLINT="${MARKDOWNLINT}${INPUT_IGNORE_PATH:+ -p ${INPUT_IGNORE_PATH}}"
MARKDOWNLINT="${MARKDOWNLINT}${INPUT_RULES:+ -r ${INPUT_RULES}}"

PROBLEM_MATCHER="$(mktemp -p "${GITHUB_WORKSPACE}")"
trap 'rm -f "${PROBLEM_MATCHER}"' EXIT
cp /markdownlint-problem-matcher.json "${PROBLEM_MATCHER:?}" || exit
echo "::add-matcher::${PROBLEM_MATCHER:?}"

# shellcheck disable=SC2086
${MARKDOWNLINT} ${INPUT_FILES}
readonly RC=$?

echo '::remove-matcher owner=markdownlint::'

exit ${RC}
