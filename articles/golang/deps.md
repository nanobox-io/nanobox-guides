# Go Dependency Management
There are many Golang dependency managers available and which on you use is completely up to you. When [building your runtime](https://docs.nanobox.io/cli/build/), Nanobox loads your apps dependencies. In order to do this, you must provide Nanobox with with `fetch` and `build` commands to load your dependencies.


```yaml
run.config:
  engine: golang
  config:
    fetch: 'go get'
    build: 'go build'
  cache_dirs:
    - vendor
```

### fetch
Defines the command to run to load dependencies in the build process.

```yaml
run.config:
  engine: golang
  config:
    fetch: 'go get'
```

### build
Defines the command to run to compile your code in the build process.

```yaml
run.config:
  engine: golang
  config:
    build: 'go build'
```

### cache_dirs
If your dependency manager vendors packages, you should include the library directories (`cache_dirs`) config in the `run.config` section of your boxfile.yml. Nanobox caches files written to cache_dirs and reuses them on subsequent builds.

```yaml
run.config:
  engine: golang
  cache_dirs:
    - vendor
```

This drastically reduces the time it takes to load dependencies after the initial build. Updates and additions to dependencies act as if the cached files are part of the local filesystem.
