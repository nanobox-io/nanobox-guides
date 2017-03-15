# Phalcon from Scratch
Part of what makes Nanobox so useful is you don't even need PHP or phalcon installed on your local machine to use them.

## Create a Phalcon project
Create a project folder and change into it:

```bash
mkdir nanobox-phalcon && cd nanobox-phalcon
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

#### Add a boxfile.yml
Nanobox uses a <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> to configure your app's environment.

At the root of your project create a `boxfile.yml` telling Nanobox you want to use the PHP <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a>:

```yaml
run.config:
  # install php and associated runtimes
  engine: php

  # php engine configuration (php version, extensions, etc)
  engine.config:

    # set the php version
    runtime: php-7.1

    # set your app's document root  
    document_root: public

    # include the phalcon extension
    extensions:
      - phalcon

  # for convenience - adds a bash alias for phalcon devtools
  extra_steps:
    - echo "alias phalcon=\'phalcon.php\'" >> /data/var/home/gonano/.bashrc

```

## Add Phalcon Devtools to your composer.json
Create a `composer.json` file in the root of your project and add the following:

```json
{
    "require-dev": {
        "phalcon/devtools": "~3.0.3"
    }
}
```

**Note:** *The version of phalcon devtools depends on which php version you're using*

## Generate a Phalcon App
Generate a Phalcon app with the following:

```bash
# drop into a nanobox console
nanobox run

# cd into a tmp folder
cd /tmp

# generate a new phalcon app
phalcon project myapp

# change back to the /app dir
cd -

# copy the generated app into your project
cp -a /tmp/myapp/* .

# exit the console
exit
```

## Add a local DNS
Add a convenient way to access your app from the browser

```bash
nanobox dns add local phalcon.dev
```

## Run the app

```bash
nanobox run php-server
```

Visit your app at <a href="http://phalcon.dev" target="\_blank">phalcon.dev</a>

## Explore
With Nanobox, you have everything you need develop and run your Phalcon app:

```bash
# drop into a Nanobox console
nanobox run

# where php is installed,
php -v

# phalcon devtools are available,
phalcon info

# and your code is mounted
ls

# exit the console
exit
```

## Now what?
Whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Add a Database](/php/phalcon/add-a-database)
* [Frontend Javascript](/php/phalcon/frontend-javascript)
* [Local Environment Variables](/php/phalcon/local-evars)
* [Back to Phalcon overview](/php/phalcon)
