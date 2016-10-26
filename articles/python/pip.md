# Pip

Pip ships with Python and is included in the [Python Engine](https://github.com/nanobox-io/nanobox-engine-ruby) making the `pip` executable available from your console.

```bash
# Console into your dev container
nanobox dev console

# Run pip commands
pip install package
```

## Pip Runs During Build
When building your runtime, the Python engine checks for a `requirements.txt` and, if it exists, runs `pip install -r requirements.txt` to load your packages.

```bash
# Build your runtime
nanobox build

# As your runtime is built, Nanobox looks for a requirements.txt.
# If it exists, it will run `pip install -r requirements.txt`
```
