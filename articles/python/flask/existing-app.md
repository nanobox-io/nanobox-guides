# Existing Flask App
Part of what makes Nanobox so useful is you don't even need python or flask installed on your local machine to use them.

## Setup

#### cd into your Flask app
Change into an existing project folder

```bash
cd my-flask-app
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

#### Add a boxfile.yml
The <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> tells Nanobox how to configure your app's environment. At the root of your project create a `boxfile.yml` telling Nanobox you want to use the python <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a>:

<div class="meta" data-method="configFile" data-params="boxfile.yml"></div>

```yaml
run.config:
  engine: python
```

## Configure Flask

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
**HEADS UP**: If your app uses a database, you'll need to [add and configure it](/python/flask/add-a-database) before your app will run.

```bash
nanobox run python myapp.py
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
