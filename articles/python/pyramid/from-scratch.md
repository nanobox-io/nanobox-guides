# Pyramid from Scratch

_**PLACEHOLDER:** This whole guide is essentially placeholder content and needs to be replaced with Pyramid-specific content._

Part of what makes Nanobox so useful is you don't even need Python or Pyramid installed on your local machine to use them.

## Create a Pyramid project
Create a project folder and change into it:

```bash
mkdir nanobox-pyramid && cd nanobox-pyramid
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

#### Add a boxfile.yml
Nanobox uses a <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> to configure your app's environment.

At the root of your project create a `boxfile.yml` telling Nanobox you want to use the Python <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a>:

```yaml
run.config:
  engine: python
```

## Generate a Pyramid App

```bash
# drop into a nanobox console
nanobox run

# install pyramid so we can use it to generate our application
pip install Pyramid

# freeze the pip modules into the requirements.txt
pip freeze > requirements.txt

# cd into the /tmp dir to create an app
cd /tmp

# generate the pyramid app
pyramid-admin startproject app

# cd back into the /app dir
cd -

# copy the generated app into the project
cp -a /tmp/app/* .

# exit the console
exit
```

## Configure Pyramid

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
nanobox dns add local pyramid.local
```

To use the DNS route you'll need to update the `ALLOWED_HOSTS` section of `app/settings.py`:

```python
ALLOWED_HOSTS = [
  'pyramid.local'
]
```

**HEADS UP**: If you want to access your app from the IP that nanobox generates for it, you'll have to add it to the `ALLOWED_HOSTS` as well. That IP can be found when dropping into a nanobox console.

## Run the app
To allow connections from the host machine into the app's container, you'll need to run your app so it listens on all available IP's (0.0.0.0).

```bash
nanobox run python manage.py runserver 0.0.0.0:8000
```

Visit your app at <a href="http://pyramid.local:8000" target="\_blank">pyramid.local:8000</a>

## Explore
With Nanobox, you have everything you need develop and run your Pyramid app:

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

* [Add a Database](/python/pyramid/add-a-database)
* [Frontend Javascript](/python/pyramid/frontend-javascript)
* [Local Environment Variables](/python/pyramid/local-evars)
* [Back to Pyramid overview](/python/pyramid)
