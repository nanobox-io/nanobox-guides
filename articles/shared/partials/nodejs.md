## Nodejs

#### Install
Installing nodejs in your run environment is as simple as adding an extra package in your `boxfile.yml`:

```yaml
run.config:
  # add nodejs to the run environment
  extra_packages:
    - nodejs
```

#### Dependencies
If you're using a package manager like `yarn` or `npm`, it is highly encouraged to add `node_modules` to the `cache_dirs` for enhanced performance:

```yaml
run.config:
  # cache node_modules
  cache_dirs:
    - node_modules
```

#### CLI Tools
Some packages include command line executables (bower, gulp, grunt, etc). To use these you'll need to add node_module's bin folder to your $PATH:

```yaml
run.config:
  # add node_module bins to the $PATH
  extra_path_dirs:
    - node_modules/.bin
```
