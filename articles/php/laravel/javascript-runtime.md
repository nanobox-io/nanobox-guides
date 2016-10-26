# Javascript Runtime
Many handy tools for tasks such as dependency management, asset compilation, etc. require Node.js, npm, and/or other javascript tools. Including Node.js in your app can done by adding the following options to the `code.build` section of your `boxfile.yml`.

## Include Node.js in Your boxfile.yml

```yaml
code.build:
  engine: php

  # Includes the Node.js package in your runtime
  extra_packages:
    - nodejs

  # Tells nanobox to cache & reuse the node_modules directory
  lib_dirs:
    - node_modules

  # Adds npm binaries to the $PATH
  paths:
    - node_modules/.bin

  # Runs npm in the final step of your build process
  after_build:
    - npm install
```

#### Using a Specific Version of Node.js
Specifying the `nodejs` package in your `boxfile.yml` will pull the most recent version of Node.js if you need a specific version of Node.js, you can append the major and minor version numbers to the package. For example: `node-4.4`. You can view the list of available node versions [here](/nodejs//config.html#runtime).

## Build a New Runtime
With these options added to your `boxfile.yml`, simply deploy the changes to the dev environment with `nanobox dev deploy`.

#### Verify installation
Once the changes have been deployed, you can verify the javascript runtime from the `nanobox dev console`:

```bash
# check the node version
node -v

# check the npm version
npm -v
```

## Now what?
With a javascript runtime available, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Local Environment Variables](/php/laravel//local-evars)
* [Prepare for Production](/php/laravel//configure-laravel)
* [Back to Rails overview](/php/laravel)
