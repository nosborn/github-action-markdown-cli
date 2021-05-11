# github-action-markdownlint-cli

A GitHub Action that performs style checking and linting for Markdown/CommonMark files using [markdownlint-cli](https://github.com/igorshubovych/markdownlint-cli).

## Usage

Basic usage with all options enabled:

```yaml

      - name: markdownlint-cli
        uses: nosborn/github-action-markdown-cli@v2.0.0
        with:
          files: .
          config_file: ".markdownlint.yaml"
          ignore_files: "examples/ignore/*"
          rules: "examples/rules/custom.js"

```

## Inputs

* `files` - what to process (files, directories, globs)
* `config_file` (optional) - configuration file (JSON or YAML)
* `ignore_files` (optional) - files to ignore/exclude (file, directory, glob)
* `rules` (optional) - custom rule files (file, directory, glob, package)

## License

The scripts and documentation in this project are released under the [MIT License](./LICENSE).
