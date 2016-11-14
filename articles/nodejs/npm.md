# npm

Nodejs ships with npm and yarn and both are included in the [Node.js Engine](https://github.com/nanobox-io/nanobox-engine-nodejs) making the `npm` and `yarn` executable available from your console. The Node.js engine checks for a `package.json` and, if found, runs `yarn` or `npm install` to load your packages.

```bash
# Console into your dev container
nanobox dev console

# Run npm commands
npm install

# Run yarn commands
yarn

# exit console
exit
```
