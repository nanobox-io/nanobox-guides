# Flask from Scratch
Part of what makes nanobox so useful is you don't have to have python or flask installed on your local machine.

This guide outlines the process used to create the <a href="https://github.com/nanobox-quickstarts/nanobox-flask" target="\_blank">nanobox-flask</a> quickstart app found under <a href="https://github.com/nanobox-quickstarts" target="\_blank">nanobox-quickstarts</a> on github.

## Build a Ruby Dev Environment
Nanobox will create an isolated virtual environment and mount your local codebase inside of. From within this environment you can run the app, a flask console, or even rake tasks as you would normally.

Decide where you want your project to live and create a folder there:

```bash
# create a project folder
mkdir nanobox-flask
```

#### Add a boxfile.yml
The boxfile.yml tells nanobox how to build and configure these environments. Create a `boxfile.yml` at the root of your project that contains the following:

```yaml
# tell nanobox to build a python runtime
code.build:
  engine: python
```

#### Build the Environment

```bash
# build a python runtime
nanobox build

# deploy the python runtime into the dev environment
nanobox dev deploy

# add a convenient way to access your app from a browser
nanobox dev dns add flask.nanobox.dev
```

## Create a Flask App
At the root of the project create a file named `hello.py` with the following:

```python
from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
  return "Hello nanobox!"

if __name__ == "__main__":
  app.run()
```

We also need to create a `requirements.txt` at the root of the project that contains the following:

```txt
Flask
```

#### Make App Accessible
We need to allow connections from the host into the app's container. To do this we need modify `hello.py` to tell flask to listen on all available IP's at port 8080:

```python
app.run(host='0.0.0.0', port=8080)
```

## Flask up-and-running
With the app configured the last thing to do is run it:

```bash
# run the app from the nanobox dev console
python hello.py
```

Visit the app from your favorite browser at: `flask.nanobox.dev:8080`

## Now what?
With an app running in a dev environment with nanobox, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Connect a database](/python/flask/connect-a-database)
* [Javascript Runtime](/python/flask/javascript-runtime)
* [Local Environment Variables](/python/flask/local-evars)
* [Back to Flask overview](/python/flask)
