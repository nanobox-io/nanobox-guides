## Task Runners

#### Gulp
**HEADS UP**: Make sure `gulp` is included in your `package.json` file as a dependency, and that you have configured [yarn](#yarn) or [npm](#npm) already as shown above.

To use gulp to generate a release that will be used during deployment, you can add an extra step to the deploy config:

```yaml
deploy.config:
  # run gulp release command
  extra_steps:
    - gulp YOUR RELEASE COMMAND
```

#### Grunt
**HEADS UP**: Make sure `grunt` is included in your `package.json` file as a dependency, and that you have configured [yarn](#yarn) or [npm](#npm) already as shown above.

To use grunt to generate a release that will be used during deployment, you can add an extra step to the deploy config:

```yaml
deploy.config:
  # run grunt release command
  extra_steps:
    - grunt YOUR RELEASE COMMAND
```

#### Brunch
**HEADS UP**: Make sure `brunch` is included in your `package.json` file as a dependency, and that you have configured [yarn](#yarn) or [npm](#npm) already as shown above.

To build a release that will be used during deployment, you can add an extra step to the deploy config:

```yaml
deploy.config:
  # run brunch build
  extra_steps:
    - brunch build
```
