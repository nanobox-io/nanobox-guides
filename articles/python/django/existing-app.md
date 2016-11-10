# Existing Django App
Part of what makes Nanobox so useful is you don't even need python or django installed on your local machine to use them.

## Setup

#### cd into your Django app

```bash
# change into your project folder
cd my-django-app
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

#### Add a boxfile.yml
The <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> tells Nanobox how to configure your app's environment. At the root of your project create a `boxfile.yml` telling Nanobox you want to use the python <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a>:

<div class="meta" data-method="configFile" data-params="boxfile.yml"></div>

```yaml
run.config:

  engine: python

  engine.config:
    runtime: python-3.5

  extra_packages:
    - nodejs

```

## Configure Django

#### Install packages via pip
If you don't already have a requirements.txt file, you'll need to install all of your app's dependencies (including Django) individually like this:

```bash
pip install Django
pip install OTHER_DEPENDENCY
```

Once they've been installed, you'll need to freeze your pip installation:

```bash
pip freeze > requirements.txt
```

#### Run data migrations

You may have some pending data migrations to be run. Let's run those now:

```bash
python manage.py migrate
```

## Run the app

```bash
python manage.py runserver 0.0.0.0:8000
```

## Check it out

```bash
# Add a convenient way to access your app from the browser
nanobox dns add local django.dev
```

Visit your app -> [django.dev:8000](http://django.dev:8000)

## Explore

With Nanobox, you have everything you need develop and run your django app:

```bash
# drop into a Nanobox console
nanobox run

# where python is installed,
python -v

# your gems are available,
pip list

# and your code is mounted
ls

# exit the console
exit
```

## Now what?
Whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Add a Database](/python/django/add-a-database)
* [Frontent Javascipt](/python/django/frontend-javascript)
* [Local Environment Variables](/python/django/local-evars)
* [Back to Django overview](/python/django)
