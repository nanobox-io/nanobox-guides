# Frontend Javascript

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
