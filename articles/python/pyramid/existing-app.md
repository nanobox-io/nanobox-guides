# Existing Pyramid App

_**PLACEHOLDER:** This whole guide is essentially placeholder content and needs to be replaced with Pyramid-specific content._

Part of what makes Nanobox so useful is you don't even need python or pyramid installed on your local machine to use them.

## Setup

#### cd into your Pyramid app
Change into an existing project folder

```bash
cd your-pyramid-app
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

#### Add a boxfile.yml
The <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> tells Nanobox how to configure your app's environment. At the root of your project create a `boxfile.yml` telling Nanobox you want to use the python <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a>:

```yaml
run.config:
  engine: python
```

## Configure Pyramid

#### Install packages via pip
If you don't already have a requirements.txt file, you'll need to install all of your app's dependencies (including Pyramid) individually and freeze them like this:

```bash
# drop into a Nanobox console
nanobox run

# install pip packages
pip install Pyramid
pip install OTHER_DEPENDENCY

# freeze your dependencies
pip freeze > requirements.txt

# exit nanobox
exit
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
**HEADS UP**: If your app uses a database, you'll need to [add and configure it](/python/pyramid/add-a-database) before your app will run.

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
