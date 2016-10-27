# Pip

Pip ships with Python and is included in the [Python Engine](https://github.com/nanobox-io/nanobox-engine-ruby) making the `pip` executable available from your console. The Python engine checks for a `requirements.txt` and, if found, runs `pip install -r requirements.txt` to load your packages.

```bash
# Console into your dev container
nanobox dev console

# Run pip commands
pip install package
```
