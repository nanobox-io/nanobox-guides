# Angular from Scratch
Part of what makes Nanobox so useful is you don't even need nodejs or angular installed on your local machine to use them.

## Create a Angular project

#### Create a Angular project folder
Create a project folder and change into it

```bash
mkdir nanobox-angular && cd nanobox-angular
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

#### Add a boxfile.yml
The <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> tells Nanobox how to configure your app's environment. At the root of your project create a `boxfile.yml` telling Nanobox you want to use the nodejs <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a>:

```yaml
run.config:
  engine: nodejs
```

## Generate a Angular App

#### Install Angular
Angular requires some initial configuration before being able to create the application. Follow the steps outlined <a href="https://angular.io/docs/ts/latest/quickstart.html#!#add-config-files" target="\_blank">here</a> to create the necessary configuration files before continuing.

**NOTE:** Ensure your project now has a `typings` folder. If it does not, you can try and manually create it with the following command:

```bash
# from the nanobox console
nanobox run npm run typings install
```

Due to the complexity of setting up a simple Angular application it is recommended that you <a href="https://angular.io/docs/ts/latest/quickstart.html#!#ngmodule" target="\_blank">follow their guide</a> steps 2 - 5. Once complete return here to get your app running with nanobox.

**NOTE:**  You can quickly launch an angular app with the <a href="https://github.com/nanobox-quickstarts/nanobox-angular" target="\_blank">nanobox-angular</a> quickstart.

## Configure Angular

#### Listen on 0.0.0.0
To allow connections from the host machine into the app's container modify the `bs-config.json` telling angular to listen on all available IP's:

```javascript
{
  "host": "0.0.0.0"
}
```

#### Add a local DNS
Add a convenient way to access your app from the browser

```bash
nanobox dns add local angular.dev
```

## Run the app

```bash
nanobox run npm start
```

Visit your app -> [angular.dev:3000](http://angular.dev:3000)

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

* [Configure Nodejs](/nodejs/angular/configure-nodejs)
* [Yarn & NPM](/nodejs/angular/package-managers)
* [Back to Angular overview](/nodejs/angular)
