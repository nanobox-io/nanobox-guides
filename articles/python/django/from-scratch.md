# Django from Scratch
Part of what makes Nanobox so useful is you don't even need python or django installed on your local machine to use them.

## Create a Python project

#### Create a Django project folder
Decide where you want your project to live and create a folder there:

```bash
# create the folder
mkdir nanobox-django

# change into the newly created folder
cd nanobox-django
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

## Generate a Django App

#### Install Django

```bash
# drop into a nanobox console
nanobox run

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

# exit the console
exit
```

#### Configure Django

With a newly created django app, you'll need to decide which apps you'll want enabled by default. You can disable any default apps by commenting them out in the `INSTALLED_APPS` section of `myapps/settings.py` file.

#### Run data migrations

Unless you commented out all of the `INSTALLED_APPS`, you'll likely have pending data migrations to be run. Let's run those now:

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

# your packages are available,
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
