# npm

Pip ships with Node.js and is included in the [Node.js Engine](https://github.com/nanobox-io/nanobox-engine-ruby) making the `npm` executable available from your console.

```bash
# Console into your dev container
nanobox dev console

# Run npm commands
npm install
```

## Bundler Runs During Build
When building your runtime, the Node.js engine checks for a `package.json` and, if it exists, runs `npm install` to load your packages.

```bash
# Build your runtime
nanobox build

# As your runtime is built, Nanobox looks for a
# package.json. If it exists, it will run `npm install`
```
