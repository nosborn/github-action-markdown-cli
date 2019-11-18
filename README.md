# github-action-markdownlint-cli

A GitHub Action that performs style checking and linting for Markdown/CommonMark files using [markdownlint-cli](https://github.com/igorshubovych/markdownlint-cli).

## Usage

Basic usage with all options enabled:

```yaml

      - name: markdownlint-cli
        uses: nosborn/github-action-markdown-cli@v1
        with:
          config_file: ".markdownlint.yaml"
          files: .
          ignore_files: "examples/ignore/*"
          rules: "examples/rules/custom.json"

```

## Inputs

* `config_file` - configuration file (JSON or YAML)
* `files` - what to process, this is required - files, directories, globs
* `ignore_files` - files to ignore/exclude - file, directory, glob
* `rules` - custom rule files - file, directory, glob, package

## License

The scripts and documentation in this project are released under the [MIT License](./LICENSE).
