# Angular from Scratch
When using nanobox with angular, keep in mind that the angular will communicate with an API that could be built in any language.

Nanobox can be used for quickly testing angular in isolation, however, think about the backend that your angular app will be communicating with and reference those guides to run your backend server with nanobox.

#### Create a Angular project folder
Create the project folder and change into it

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

## Create a Angular App
Angular requires some initial configuration before being able to create the application. Follow the steps outlined <a href="https://angular.io/docs/ts/latest/quickstart.html#!#add-config-files" target="\_blank">here</a> to create the necessary configuration files before continuing.

**NOTE:** Ensure your project now has a `typings` folder. If it does not, you can try and manually create it with the following command:

```bash
# from the nanobox console
nanobox run npm run typings install
```

With the application configured; due to the complexity of setting up a simple Angular application it is recommended that you <a href="https://angular.io/docs/ts/latest/quickstart.html#!#ngmodule" target="\_blank">follow their guide</a> steps 2 - 5. Once complete return here to get your app running with nanobox.

**NOTE:** We've also created a <a href="https://github.com/nanobox-quickstarts/nanobox-angularjs" target="\_blank">nanobox-angularjs</a> quickstart that was created following their guide which can be used to quickly launch an Angular app with nanobox.

#### Configure Angular
To allow connections from the host machine into the app's container modify the `bs-config.json` telling angular to listen on all available IP's at port 8080:

```javascript
{
  "host": "0.0.0.0",
  "port": 8080
}
```

Also, add a convenient way to access your app from a browser:

```bash
nanobox dev dns add angular.nanobox.dev
```

## Angular up-and-running
Console into the dev environment with `nanobox dev console` and run the app like you would normally:

```bash
npm start
```

Once the app has started you can visit it from your favorite browser at `angular.nanobox.dev`.

## Now what?
With an app running in a dev environment with nanobox, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Add a Database](/javascript/angular/add-a-database)
* [Javascript Runtime](/javascript/angular/javascript-runtime)
* [Local Environment Variables](/javascript/angular/local-evars)
* [Back to Angular overview](/javascript/angular)
