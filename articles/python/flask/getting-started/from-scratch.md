# Flask from Scratch
Part of what makes nanobox so useful is you don't even need python or flask installed on your local machine to use them.

This guide outlines the process used to create the <a href="https://github.com/nanobox-quickstarts/nanobox-flask" target="\_blank">nanobox-flask</a> quickstart app found under <a href="https://github.com/nanobox-quickstarts" target="\_blank">nanobox-quickstarts</a> on github.

## Build a Ruby Dev Environment
Nanobox creates an isolated virtual environment for your app, mounting the app's codebase inside.

From within this environment you can develop and run your app as you normally would with things like *pip install*.

#### Create a Flask project folder
Decide where you want your project to live and create a folder there:

```bash
mkdir nanobox-flask
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

## Create a Flask App
Create a basic flask app named `hello.py` at the root of your project:

```python
from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
  return "Hello nanobox!"

if __name__ == "__main__":
  app.run()
```

Also, create a `requirements.txt` that includes flask:

```txt
Flask
```

#### Configure Flask
To allow connections from the host machine into the app's container modify the `hello.py` telling flask to listen on all available IP's at port 8080:

```python
app.run(host='0.0.0.0', port=8080)
```

Also, add a convenient way to access your app from a browser:

```bash
nanobox dev dns add flask.nanobox.dev
```

## Flask up-and-running
Console into the dev environment with `nanobox dev console` and run the app like you would normally:

```bash
python hello.py
```

Once the app has started you can visit it from your favorite browser at `flask.nanobox.dev:8080`.

## Now what?
With an app running in a dev environment with nanobox, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Add a Database](/python/flask/next-steps/add-a-database)
* [Javascript Runtime](/python/flask/next-steps/javascript-runtime)
* [Local Environment Variables](/python/flask/next-steps/local-evars)
* [Back to Flask overview](/python/flask)
