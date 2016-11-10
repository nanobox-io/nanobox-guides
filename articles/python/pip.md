# Pip

Pip is included in the [Python Engine](https://github.com/nanobox-io/nanobox-engine-ruby) making the `pip` executable available from your console. When building the runtime, the Python engine checks for a `requirements.txt` and, if found, runs `pip install -r requirements.txt` to install your python packages.

## Adding a package

```bash
# Console into your dev container
nanobox dev console

# Run pip commands
pip install gunicorn

# add the newly installed dependency to the requirements.txt
pip freeze > requirements.txt
```
