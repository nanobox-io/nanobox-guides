# Javascript Runtime
Including Node.js in your app can done by adding the following options to the `code.build` section of your `boxfile.yml`.

## Include Node.js in Your boxfile.yml

```yaml
code.build:
  engine: python

  # Includes the Node.js package in your dev environment
  dev_packages:
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
Specifying the `nodejs` package in your `boxfile.yml` will pull the most recent version of Node.js if you need a specific version of Node.js, you can append the major and minor version numbers to the package. For example: `node-4.4`. You can view the list of available node versions [here](/nodejs/config.html#runtime).

#### Apply Changes
With these options added to your `boxfile.yml`, the next time you enter in the dev console `nanobox dev console`, nodejs will be available.

#### Verify installation
You can verify the javascript runtime from the `nanobox dev console`:

```bash
# check the node version
node -v

# check the npm version
npm -v
```

## Now what?
With a javascript runtime available, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Local Environment Variables](/python/flask/local-evars)
* [Prepare for Production](/python/flask/configure-flask)
* [Back to Rails overview](/python/flask)
