# Express from Scratch
Part of what makes Nanobox so useful is you don't even need Nodejs or Express installed on your local machine to use them.

## Create an Express project
Create the project folder and change into it:

```bash
mkdir nanobox-express && cd nanobox-express
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

#### Add a boxfile.yml
Nanobox uses a <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> to configure your app's environment.

At the root of your project create a `boxfile.yml` telling Nanobox you want to use the Nodejs <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a>:

```yaml
run.config:
  engine: nodejs
```

## Generate an Express App

```bash
# drop into a nanobox console
nanobox run

# install express.js and save to package.json
npm install express --save

# install the express generator
npm install express-generator -g

# build an express skeleton
express

# Answer 'y' when notified the destination is not empty

# install express npm packages
npm install

# exit the console
exit
```

## Configure Express

#### Listen on 0.0.0.0
To allow connections from the host machine into the app's container, you'll need to configure your app to listen on all available IP's (0.0.0.0) by modifying the `bin/www`:

```javascript
server.listen(port, '0.0.0.0');
```

## Add a local DNS
Add a convenient way to access your app from the browser:

```bash
nanobox dns add local express.local
```

## Run the app

```bash
nanobox run npm start
```

Visit your app at <a href="http://express.local:3000" target="\_blank">express.local:3000</a>

## Explore
With Nanobox, you have everything you need develop and run your express app:

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

* [Add a Database](/nodejs/express/add-a-database)
* [Frontend Javascript](/nodejs/express/frontend-javascript)
* [Local Environment Variables](/nodejs/express/local-evars)
* [Back to Express overview](/nodejs/express)
