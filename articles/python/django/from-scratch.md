# Django from Scratch
Part of what makes Nanobox so useful is you don't even need Python or Django installed on your local machine to use them.

## Create a Django project
Create a project folder and change into it:

```bash
mkdir nanobox-django && cd nanobox-django
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

#### Add a boxfile.yml
Nanobox uses a <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> to configure your app's environment.

At the root of your project create a `boxfile.yml` telling Nanobox you want to use the Python <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a>:

```yaml
run.config:
  engine: python
```

## Generate a Django App

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
django-admin startproject app

# cd back into the /app dir
cd -

# copy the generated app into the project
cp -a /tmp/app/* .

# exit the console
exit
```

## Configure Django

#### Run data migrations
Run a data migration for any remaining `INSTALLED_APPS`:
You'll need to decide which apps you want enabled by default. You can disable any default apps by commenting them out in the `INSTALLED_APPS` section of `app/settings.py` file.

#### Run data migrations
Unless you commented out all of the `INSTALLED_APPS`, you'll need to run any pending data migrations:

```bash
nanobox run python manage.py migrate
```

## Add a local DNS
Add a convenient way to access your app from the browser:

```bash
nanobox dns add local django.dev
```

To use the DNS route you'll need to update the `ALLOWED_HOSTS` section of `app/settings.py`:

```python
ALLOWED_HOSTS = [
  'django.dev'
]
```

**HEADS UP**: If you want to access your app from the IP that nanobox generates for it, you'll have to add it to the `ALLOWED_HOSTS` as well. That IP can be found when dropping into a nanobox console.

## Run the app
To allow connections from the host machine into the app's container, you'll need to run your app so it listens on all available IP's (0.0.0.0).

```bash
nanobox run python manage.py runserver 0.0.0.0:8000
```

Visit your app at <a href="http://django.dev:8000" target="\_blank">django.dev:8000</a>

## Explore
With Nanobox, you have everything you need develop and run your Django app:

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
* [Frontend Javascript](/python/django/frontend-javascript)
* [Local Environment Variables](/python/django/local-evars)
* [Back to Django overview](/python/django)
