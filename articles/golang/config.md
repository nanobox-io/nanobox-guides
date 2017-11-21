# Configure Golang

The Golang engine exposes configuration options through the [boxfile.yml](http://docs.nanobox.io/boxfile/).

```yaml
run.config:
  engine: golang
  config:
    package: 'github.com/username/code'
    runtime: go-1.9
    fetch: 'go get'
    build: 'go build'
```

#### package *(required)*
Specifies the path to the directory in which your code is stored. This can be a local or remote directory.

```yaml
run.config:
  engine: golang
  config:
    package: 'github.com/username/code'
```

#### runtime
Specifies which Golang runtime to use. The following runtimes are available:

- go-1.4
- go-1.5
- go-1.6
- go-1.7
- go-1.8
- go-1.9

```yaml
run.config:
  engine: golang
  config:
    runtime: go-1.9
```

#### fetch
Defines the command to run to load dependencies in the build process.

```yaml
run.config:
  engine: golang
  config:
    fetch: 'go get'
```

#### build
Defines the command to run to compile your code in the build process.

```yaml
run.config:
  engine: golang
  config:
    build: 'go build'
```
