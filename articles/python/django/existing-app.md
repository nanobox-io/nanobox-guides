# Existing Django App
Part of what makes Nanobox so useful is you don't even need python or django installed on your local machine to use them.

## Setup

#### cd into your Django app
Change into an existing project folder

```bash
cd my-django-app
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

#### Add a boxfile.yml
The <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> tells Nanobox how to configure your app's environment. At the root of your project create a `boxfile.yml` telling Nanobox you want to use the python <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a>:

```yaml
run.config:
  engine: python
```

## Configure Django

#### Install packages via pip
If you don't already have a requirements.txt file, you'll need to install all of your app's dependencies (including Django) individually and freeze them like this:

```bash
# drop into a Nanobox console
nanobox run

# install pip packages
pip install Django
pip install OTHER_DEPENDENCY

# freeze your dependencies
pip freeze > requirements.txt

# exit nanobox
exit
```

#### Add a local DNS
Add a convenient way to access your app from the browser

```bash
nanobox dns add local django.dev
```

## Run the app

**HEADS UP**: If your app uses a database, you'll need to [add and configure it](/python/django/add-a-database) before your app will run.

```bash
nanobox run python manage.py runserver 0.0.0.0:8000
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
* [Local Environment Variables](/python/django/local-evars)
* [Back to Django overview](/python/django)
