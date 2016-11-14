# Flask from Scratch
Part of what makes Nanobox so useful is you don't even need python or flask installed on your local machine to use them.

## Create a Flask project

#### Create a Flask project folder
Create a project folder and change into it

```bash
mkdir nanobox-flask && cd nanobox-flask
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

#### Add a boxfile.yml
The <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> tells Nanobox how to configure your app's environment. At the root of your project create a `boxfile.yml` telling Nanobox you want to use the python <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a>:

<div class="meta" data-method="configFile" data-params="boxfile.yml"></div>

```yaml
run.config:
  engine: python
```

## Generate a Flask App

#### Install flask

```bash
# drop into a nanobox console
nanobox run

# install flask via pip
pip install Flask

# freeze the dependencies into the requirements.txt file
pip freeze > requirements.txt

# exit the console
exit
```

#### Create Flask App
Create a basic flask app named `hello.py` at the root of your project:

```python
from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
  return "Hello nanobox!"
```

## Configure Flask

#### Listen on 0.0.0.0
To allow connections from the host machine into the app's container tell flask to listen on all available IP's:

```python
if __name__ == "__main__":
  app.run(host='0.0.0.0')
```

#### Add a local DNS
Add a convenient way to access your app from the browser

```bash
nanobox dns add local flask.dev
```

## Run the app

```bash
nanobox run python hello.py
```

Visit your app -> [flask.dev:3000](http://flask.dev:3000)

## Explore
With Nanobox, you have everything you need develop and run your flask app:

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

* [Add a Database](/python/flask/add-a-database)
* [Local Environment Variables](/python/flask/local-evars)
* [Back to Flask overview](/python/flask)
