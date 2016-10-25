# Existing Django App
Part of what makes nanobox so useful is you don't even need python or django installed on your local machine to use them.

This guide will help you get an existing Django app up-and-running with nanobox.

## Build a Ruby Dev Environment
Nanobox creates an isolated virtual environment for your app, mounting the app's codebase inside.

From within this environment you can develop and run your app as you normally would with things like `pip install`.

**IMPORTANT**: Make sure to change directories into your project at this point, as all `nanobox dev` commands will be run from the root of your project.

#### Add a boxfile.yml
The <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> tells nanobox how to build and configure your app's environment. At the root of your project create a `boxfile.yml` telling nanobox you want to use the python <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a> (a set of scripts that configure an environment):

```yaml
code.build:
  engine: python
```

#### Start the Environment
You can then start the dev environment:

```bash
nanobox dev start
```

## Configure Django
WIP

Also, add a convenient way to access your app from a browser:

```bash
nanobox dev dns add django.nanobox.dev
```

## Django up-and-running
Console into the dev environment with `nanobox dev console` and run the app like you would normally:

```bash
python manage.py runserver 0.0.0.0:8080
```

Once the app has started you can visit it from your favorite browser at `django.nanobox.dev:8080`.

## Now what?
With an app running in a dev environment with nanobox, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Add a Database](/python/django/next-steps/add-a-database)
* [Javascript Runtime](/python/django/next-steps/javascript-runtime)
* [Local Environment Variables](/python/django/next-steps/local-evars)
* [Back to Django overview](/python/django)
