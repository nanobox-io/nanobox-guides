# Configure Node.js

The Node.js engine exposes configuration options through the [boxfile.yml](http://docs.nanobox.io/boxfile/).

#### runtime
Specifies which Node.js runtime and version to use. The following runtimes are available:

- nodejs-0.8
- nodejs-0.10
- nodejs-0.12
- nodejs-4.8
- nodejs-5.12
- nodejs-6.11
- nodejs-7.10
- nodejs-8.6
- nodejs-8.9

```yaml
run.config:
  engine: nodejs
  engine.config:
    runtime: nodejs-8.6
```

#### python_version
The Node.js engine ships with the latest version of Python installed. The `python_version` setting allows you to specify a specific version of Python. The following are available:

- python-2.7
- python-3.4
- python-3.5
- python-3.6

```yaml
run.config:
  engine: nodejs
  engine.config:
    python_version: python-2.7
```
