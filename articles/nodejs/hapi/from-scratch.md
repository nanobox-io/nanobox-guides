# Hapi from Scratch
Part of what makes Nanobox so useful is you don't even need Nodejs or Hapi installed on your local machine to use them.

## Create a Hapi project
Create the project folder and change into it:

```bash
mkdir nanobox-hapi && cd nanobox-hapi
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

#### Add a boxfile.yml
Nanobox uses a <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> to configure your app's environment.

At the root of your project create a `boxfile.yml` telling Nanobox you want to use the Nodejs <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a>:

```yaml
run.config:
  engine: nodejs
```

## Create a Hapi App
Create a basic Hapi app at the root of your project named `server.js`:

```javascript
'use strict';

const Hapi = require('hapi');

const server = new Hapi.Server();
server.connection({ port: 3000 });

server.route({
  method: 'GET',
  path: '/',
  handler: function (request, reply) {
      reply('Hello, nanobox!');
  }
});

server.start((err) => {
  if (err) {
      throw err;
  }
  console.log(`Server running at: ${server.info.uri}`);
});
```
#### Install Hapi

```bash
# drop into a nanobox console
nanobox run

# install hapi.js and save to package.json
npm install hapi --save

# exit the console
exit
```

## Configure Hapi

#### Listen on 0.0.0.0
To allow connections from the host machine into the app's container, your app needs to listen on all available IP's (0.0.0.0). Hapi does this by default, and so no additional configuration is needed.

## Add a local DNS
Add a convenient way to access your app from the browser:

```bash
nanobox dns add local hapi.dev
```

## Run the app

```bash
nanobox run npm start
```

Visit your app at <a href="http://hapi.dev:3000" target="\_blank">hapi.dev:3000</a>

## Explore
With Nanobox, you have everything you need develop and run your Hapi app:

```bash
# drop into a Nanobox console
nanobox run

# where node is installed,
node -v

# npm is installed,
npm -v

# and your code is mounted
ls

# exit the console
exit
```

## Now what?
Whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Add a Database](/nodejs/hapi/add-a-database)
* [Frontend Javascript](/nodejs/hapi/frontend-javascript)
* [Local Environment Variables](/nodejs/hapi/local-evars)
* [Back to Hapi overview](/nodejs/hapi)
