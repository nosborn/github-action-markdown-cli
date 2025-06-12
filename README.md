# github-action-markdown-cli

A GitHub Action that performs style checking and linting for Markdown/CommonMark files using [markdownlint-cli](https://github.com/igorshubovych/markdownlint-cli).

[![CI Workflow Status](https://github.com/nosborn/github-action-markdown-cli/actions/workflows/ci.yml/badge.svg)](https://github.com/nosborn/github-action-markdown-cli/actions/workflows/ci.yml)
[![Release Workflow Status](https://github.com/nosborn/github-action-markdown-cli/actions/workflows/release.yml/badge.svg)](https://github.com/nosborn/github-action-markdown-cli/actions/workflows/release.yml)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/nosborn/github-action-markdown-cli/badge)](https://scorecard.dev/viewer/?uri=github.com/nosborn/github-action-markdown-cli)

## Usage

Basic usage with all options enabled:

```yaml
- name: markdownlint-cli
  uses: nosborn/github-action-markdown-cli@v3.5.0
  with:
    files: .
    config_file: .markdownlint.yaml
    dot: true
    ignore_files: examples/ignore/*
    ignore_path: examples/.markdownlintignore
    rules: examples/rules/custom.js
```

## Inputs

- `files` - what to process (files, directories, globs)
- `config_file` (optional) - configuration file (JSON or YAML)
- `dot` (optional) - include files/folders with a dot (for example `.github`)
- `ignore_files` (optional) - files to ignore/exclude (file, directory, glob)
- `ignore_path` (optional) - path to file with ignore pattern(s)
- `rules` (optional) - custom rule files (file, directory, glob, package)

## License

The scripts and documentation in this project are released under the [MIT License](./LICENSE).
