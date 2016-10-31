# Django from Scratch
Part of what makes nanobox so useful is you don't even need python or django installed on your local machine to use them.

This guide outlines the process used to create the <a href="https://github.com/nanobox-quickstarts/nanobox-django" target="\_blank">nanobox-django</a> quickstart app found under <a href="https://github.com/nanobox-quickstarts" target="\_blank">nanobox-quickstarts</a> on github.

## Create a Python Dev Environment
Nanobox creates an isolated virtual environment for your app, mounting the app's codebase inside.

From within this environment you can develop and run your app as you normally would with things like *pip install*.

#### Create a Django project folder
Decide where you want your project to live and create a folder there:

```bash
# create the project directory
mkdir nanobox-django

# cd into the project
cd nanobox-django
```

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

## Create a Django App
Once the dev environment is started you can console into it and create a new django application:

```bash
# console into the dev environment
nanobox dev console

# install django so we can use it to generate our application
pip install Django

# freeze the pip modules into the requirements.txt
pip freeze > requirements.txt

# cd into the /tmp dir to create an app
cd /tmp

# generate the django app
django-admin startproject myapp

# cd back into the /app dir
cd -

# copy the generated app into the project
cp -a /tmp/myapp/* .
```

#### Configure Django

With a newly created django app, you'll need to decide which apps you'll want enabled by default. You can disable any default apps by commenting them out in the `INSTALLED_APPS` section of `myapps/settings.py` file.

#### Run data migrations

Unless you commented out all of the `INSTALLED_APPS`, you'll likely have pending data migrations to be run. Let's run those now:

```bash
python manage.py migrate
```

## Django up-and-running
Add a convenient way to access your app from a browser:

```bash
nanobox dev dns add django.nanobox.dev
```

Now console into the dev environment with `nanobox dev console` and run the app like you would normally:

```bash
python manage.py runserver 0.0.0.0:8080
```

Once the app has started you can visit it from your favorite browser at `django.nanobox.dev`.

## Now what?
With an app running in a dev environment with nanobox, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Add a Database](/python/django/add-a-database)
* [Javascript Runtime](/python/django/javascript-runtime)
* [Local Environment Variables](/python/django/local-evars)
* [Back to Django overview](/python/django)
