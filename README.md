# github-action-markdown-cli

A GitHub Action that performs style checking and linting for Markdown/CommonMark files using [markdownlint-cli](https://github.com/igorshubovych/markdownlint-cli).

[![CI Workflow Status](https://github.com/nosborn/github-action-markdown-cli/actions/workflows/ci.yml/badge.svg)](https://github.com/nosborn/github-action-markdown-cli/actions/workflows/ci.yml)
[![Release Workflow Status](https://github.com/nosborn/github-action-markdown-cli/actions/workflows/release.yml/badge.svg)](https://github.com/nosborn/github-action-markdown-cli/actions/workflows/release.yml)

## Usage

Basic usage with all options enabled:

```yaml
- name: markdownlint-cli
  uses: nosborn/github-action-markdown-cli@v3.0.1
  with:
    files: .
    config: .markdownlint.yaml
    ignore: examples/ignore/*
    ignore_path: examples/.markdownlintignore
    rules: examples/rules/custom.js
```

## Inputs

- `files` - what to process (files, directories, globs)
- `config` (optional) - configuration file (JSON or YAML)
- `ignore` (optional) - files to ignore/exclude (file, directory, glob)
- `ignore_path` (optional) - path to file with ignore pattern(s)
- `rules` (optional) - custom rule files (file, directory, glob, package)

### Deprecated inputs

These inputs are still available but will be removed in a future major version.

- `config_file` (optional) - configuration file (JSON or YAML) - superseded by `config`
- `ignore_files` (optional) - files to ignore/exclude (file, directory, glob) - superseded by `ignore`

## License

The scripts and documentation in this project are released under the [MIT License](./LICENSE).
