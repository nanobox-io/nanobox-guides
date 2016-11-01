# Existing Flask App
Part of what makes nanobox so useful is you don't even need python or flask installed on your local machine to use them.

This guide will help you get an existing Flask app up-and-running with nanobox.

## Create a Python Dev Environment
Nanobox creates an isolated virtual environment for your app, mounting the app's codebase inside.

From within this environment you can develop and run your app as you normally would with things like *pip install*.

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

Also, add a convenient way to access your app from a browser:

```bash
nanobox dev dns add flask.nanobox.dev
```

## Configure Flask
Once the dev environment is started you can console into it and configure your existing django application:

```bash
# console into the dev environment
nanobox dev console

```

#### Install packages via pip
If you don't already have a requirements.txt file, you'll need to install all of your app's dependencies (including Flask) individually like this:

```bash
pip install Flask
pip install OTHER_DEPENDENCY
```

Once they've been installed, you'll need to freeze your pip installation:

```bash
pip freeze > requirements.txt
```

#### Listen on all interfaces
Because nanobox runs inside containers, we need to tell flask to bind to all interfaces which will make the app accessible to host:

```python
if __name__ == "__main__":
  app.run(host='0.0.0.0')
```

## Flask up-and-running
From within the same `nanobox dev console` session, run the app as you would normally:

```bash
python APP_NAME.py
```

Once the app has started you can visit it from your favorite browser at `flask.nanobox.dev:5000`.

## Now what?
With an app running in a dev environment with nanobox, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Add a Database](/python/flask/add-a-database)
* [Javascript Runtime](/python/flask/javascript-runtime)
* [Local Environment Variables](/python/flask/local-evars)
* [Back to Flask overview](/python/flask)
