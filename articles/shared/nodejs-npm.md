# Using Node.js & npm

Many handy tools for tasks such as dependency management, asset compilation, etc. require Node.js and npm. Including Node.js in your app can done through adding the following options to the `code.build` section of your boxfile.yml.

## Include Node.js in Your boxfile.yml

```yaml
code.build:
  engine: #your-engine

  # Includes the Node.js package in your runtime
  extra_packages:
    - nodejs

  # Tells nanobox to cache & reuse the node_modules directory
  lib_dirs:
    - node_modules

  # Runs npm in the final step of your build process
  after_build:
    - npm install
```

## Build a New Runtime
With these options added to your boxfile.yml, build a new runtime to install the Node.js package and run npm.

```bash
# build a new runtime
nanobox build
```

## Console In & Use
When the newly built runtime, you can console in and use `node`, `npm`, and any other tools installed with them.

```bash
# console into your dev environment
nanobox dev console

# check the node version
node -v

# check the npm version
npm -v
```
