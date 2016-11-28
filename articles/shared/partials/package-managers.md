## Package Managers

#### Yarn
To use `yarn` you'll need to run `yarn` as an extra step in the run environment. We recommend using yarn over npm at this point.

```yaml
run.config:
  # run yarn
  extra_steps:
    - yarn
```

#### NPM
To use `npm` you'll need to add `npm install` as an extra step in the run environment.

```yaml
run.config:
  # run npm install
  extra_steps:
    - npm install
```

#### Bower
**HEADS UP**: Make sure `bower` is included in your `package.json` file as a dependency, and that you have configured [yarn](#yarn) or [npm](#npm) already as shown above.

To use `bower` you'll need to add `bower install` as an extra step in the run environment.

```yaml
run.config:
  # run bower install
  extra_steps:
    - bower install
```

It is highly encouraged to add `bower_components` to the `cache_dirs` for enhanced performance:

```yaml
run.config:
  # cache bower_components
  cache_dirs:
    - bower_components
```
