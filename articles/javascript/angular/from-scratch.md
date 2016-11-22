# Angular from Scratch
Part of what makes Nanobox so useful is you don't even need Nodejs or Angular installed on your local machine to use them.

## Create a Angular project
Create a project folder and change into it:

```bash
mkdir nanobox-angular && cd nanobox-angular
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

#### Add a boxfile.yml
Nanobox uses a <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> to configure your app's environment.

At the root of your project create a `boxfile.yml` telling Nanobox you want to use the Nodejs <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a>:

```yaml
run.config:
  engine: nodejs
```

## Generate a Angular App
**HEADS UP**:  You can quickly launch an angular app with the <a href="https://github.com/nanobox-quickstarts/nanobox-angular" target="\_blank">nanobox-angular</a> quickstart.

#### Setup
Angular requires some initial configuration before being able to create the application. Follow the steps outlined <a href="https://angular.io/docs/ts/latest/quickstart.html#!#add-config-files" target="\_blank">here</a> to create the necessary configuration files before continuing.

Once you've got the necessary config files in place run `nanobox run npm install`.

#### Create the app
Due to the complexity of creating a simple Angular application it is recommended that you follow their guide <a href="https://angular.io/docs/ts/latest/quickstart.html#!#ngmodule" target="\_blank">steps 2 - 5</a>. Once complete return here to get your app running with nanobox.

## Configure Angular

#### Listen on 0.0.0.0
To allow connections from the host machine into the app's container, you'll need to configure your app to listen on all available IP's (0.0.0.0) by modifying the `bs-config.json`:

```javascript
{
  "host": "0.0.0.0"
}
```

#### Add a local DNS
Add a convenient way to access your app from the browser:

```bash
nanobox dns add local angular.dev
```

## Run the app

```bash
nanobox run npm start
```

Visit your app at <a href="http://angular.dev:3000" target="\_blank">angular.dev:3000</a>

## Explore
With Nanobox, you have everything you need develop and run your angular app:

```bash
# drop into a Nanobox console
nanobox run

# where nodejs is installed,
node -v

# your packages are available,
npm list

# and your code is mounted
ls

# exit the console
exit
```

## Now what?
Whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Configure Nodejs](/javascript/angular/configure-nodejs)
* [Yarn & NPM](/javascript/angular/package-managers)
* [Back to Angular overview](/javascript/angular)
