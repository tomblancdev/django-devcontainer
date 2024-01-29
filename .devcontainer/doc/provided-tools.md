# What's in it? 📦

## Pyenv

[Pyenv](https://github.com/pyenv/pyenv) is a tool for managing multiple Python versions. It's installed in the container and configured to use the latest Python 3.11.0 version.

you can change it easily by editing the `Dockerfile` and changing the `PYTHON_VERSION` environment variable.

```dockerfile
# ...
ARG PYTHON_VERSION=3.11 # 👈 Change this to your desired version
# ...
```

## Poetry

[Poetry](https://python-poetry.org/) is a tool for dependency management and packaging in Python. It's installed in the container and configured to use the latest version.

## pre-commit

[pre-commit](https://pre-commit.com/) is a framework for managing and maintaining multi-language pre-commit hooks. It's installed in the container and configured to use the latest version.

Located in the `.pre-commit-config.yaml` file you can find the pre-commit hooks that are installed in the container.

Please refer to the [pre-commit documentation](https://pre-commit.com/) for more information.

### Default pre-commit hooks

| Hook | Description |
| --- | --- |
|end-of-file-fixer | Makes sure files end in a newline and only a newline.|
| trailing-whitespace | Trims trailing whitespace.|
| check-symlinks | Check for symlinks of files checked into git.|
| check-toml | Check toml files for syntax errors |
| check-xml | Check xml files for syntax errors |
| check-yaml | Check yaml files for syntax errors |
| detect-private-key | Prevents you from committing private keys into git repositories. |
| no-commit-to-branch | Prevents you from committing to a branch that matches a regex.(default: master and main) |
| check-json5 | Check json5 files for syntax errors |
| black | Black is the uncompromising Python code formatter. |
| ruff | Ruff linting for Python. |
| ruff-format | Ruff formatting for Python. |
| test | Runs pytest on all files. |


## mypy

[mypy](https://mypy.readthedocs.io/en/stable/) is an optional static type checker for Python. It's installed in the container and configured to use the latest version.

## Ruff

[Ruff](https://github.com/astral-sh/ruff) is an "extremmely fast" Python linter. It's installed in the container and configured to use the latest version.

## Black

[Black](https://github.com/psf/black) is an opinionated code formatter for Python. It's installed in the container and configured to use the latest version.

## VS Code Extensions

The following VS Code extensions are installed in the container:
- [python](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
- [autodocstring](https://marketplace.visualstudio.com/items?itemName=njpwerner.autodocstring)
- [ruff](https://marketplace.visualstudio.com/items?itemName=astralsh.ruff)
- [mypy](https://marketplace.visualstudio.com/items?itemName=ms-python.mypy)
- [cspell](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker)

### Default settings

### Editor

```json
{
    "editor.codeActionsOnSave": {
        "source.fixAll": "explicit",
        "source.organizeImports": "explicit"
    },
    "editor.formatOnSave": true,
    "editor.formatOnPaste": true,
}
```

### Python

```json
{
    "[python]": {
        "editor.defaultFormatter": "charliermarsh.ruff"
    },
    "ruff.interpreter": [
        "/workspace/.venv/bin/python"
    ],
    "python.defaultInterpreterPath": "/workspace/.venv/bin/python",
    "python.terminal.activateEnvInCurrentTerminal": true,
    "python.terminal.activateEnvironment": true,
    "python.analysis.autoImportCompletions": true,
    "python.analysis.typeCheckingMode": "basic"

}
```
