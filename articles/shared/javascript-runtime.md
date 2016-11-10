# Javascript Runtime
Including Node.js in your app can done by adding the following options to the `code.build` section of your boxfile.yml.

## Include Node.js in Your boxfile.yml

```yaml
code.build:
  engine: <engine> # this will be the engine that pertains to your application

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
Specifying the `nodejs` package in your boxfile.yml will pull the most recent version of Node.js if you need a specific version of Node.js, you can append the major and minor version numbers to the package. For example: `node-4.4`. You can view the list of available node versions in the [Node.js Settings guide](#).


## Bower

If you need bower blablabla