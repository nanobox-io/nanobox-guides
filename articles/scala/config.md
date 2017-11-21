# Configure Scala

The Scala engine exposes configuration options through the [boxfile.yml](http://docs.nanobox.io/boxfile/).

### Scala Settings
The following setting allows you to define your Scala runtime environment.

#### java_runtime
Specifies which Java runtime and version to use. The following runtimes are available:

- openjdk8
- sun-jdk6
- sun-jdk7
- oracle-jdk8

```yaml
run.config:
  engine: python
  engine.config:
    java_runtime: oracle-jdk8
```
