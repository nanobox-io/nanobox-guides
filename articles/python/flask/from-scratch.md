# Flask from Scratch
Part of what makes Nanobox so useful is you don't even need Python or Flask installed on your local machine to use them.

## Create a Flask project
Create a project folder and change into it:

```bash
mkdir nanobox-flask && cd nanobox-flask
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

#### Add a boxfile.yml
Nanobox uses a <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> to configure your app's environment.

At the root of your project create a `boxfile.yml` telling Nanobox you want to use the Python <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a>:

```yaml
run.config:
  engine: python
```

## Create a Flask App
Create a basic Flask app at the root of your project named `app.py`:

```python
from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello nanobox!"
```

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

## Configure Flask

#### Listen on 0.0.0.0
To allow connections from the host machine into the app's container, you'll need to configure your app to listen on all available IP's (0.0.0.0).

```python
if __name__ == "__main__":
    app.run(host='0.0.0.0')
```

## Add a local DNS
Add a convenient way to access your app from the browser:

```bash
nanobox dns add local flask.dev
```

## Run the app

```bash
nanobox run python app.py
```

Visit your app at <a href="http://flask.dev:5000" target="\_blank">flask.dev:5000</a>

## Explore
With Nanobox, you have everything you need develop and run your Flask app:

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
* [Frontend Javascript](/python/flask/frontend-javascript)
* [Local Environment Variables](/python/flask/local-evars)
* [Back to Flask overview](/python/flask)
