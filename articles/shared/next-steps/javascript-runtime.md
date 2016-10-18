# Javascript Runtime
Many handy tools for tasks such as dependency management, asset compilation, etc. require Node.js, npm, and/or other javascript tools. Including Node.js in your app can done by adding the following options to the `code.build` section of your boxfile.yml.

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

## Build a New Runtime
With these options added to your boxfile.yml, build a new runtime to install the Node.js package and run npm.

```bash
# build a new runtime
nanobox build

# deploy the environment to the dev runtime
nanobox dev deploy
```

#### Verify installation
With the newly built runtime, you can console in and use `node`, and `npm` like you would normally.

```bash
# console into your dev environment
nanobox dev console

# check the node version
node -v

# check the npm version
npm -v
```

## Now what?
With a javascript runtime available, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Local Environment Variables](/ruby/sinatra/next-steps/local-evars)
* [Prepare for Production](/ruby/sinatra/production/configure-sinatra)
* [Back to Sinatra overview](/ruby/sinatra)
