# Zend Framework from Scratch

_**PLACEHOLDER:** This whole guide is essentially placeholder content and needs to be replaced with Zend Framework-specific content._

Part of what makes Nanobox so useful is you don't even need PHP or zendframework installed on your local machine to use them.

## Create a Zend Framework project
Create a project folder and change into it:

```bash
mkdir nanobox-zendframework && cd nanobox-zendframework
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

    # sets the php version to 7.0
    runtime: php-7.0

    # enables php extensions
    extensions:
      - ctype
      - dom
      - iconv
      - mbstring
      - pdo
      - session
      - simplexml
      - tokenizer
      - xml
      - zlib
```

## Generate a Zend Framework App

**HEADS UP**: The Zend Framework installer requires that your nanobox VM has at least 2GB of RAM available. You can manage your VM's resources with the <a href="https://docs.nanobox.io/cli/configure/", target="\_blank"><code>nanobox config command</code></a>.

```bash
# drop into a nanobox console
nanobox run

# download the zendframework installer
sudo curl -LsS https://zendframework.com/installer -o /usr/local/bin/zendframework

# make it executable
sudo chmod a+x /usr/local/bin/zendframework

# cd into a tmp folder
cd /tmp

# generate a new zendframework app
zendframework new app

# change back to the /app dir
cd -

# copy the generated app into your project
cp -a /tmp/app/* .

# run composer for the first time
composer install --prefer-source

# exit the console
exit
```

## Add a local DNS
Add a convenient way to access your app from the browser

```bash
nanobox dns add local zendframework.local
```

## Run the app

```bash
nanobox run php bin/console server:run 0.0.0.0
```

Visit your app at <a href="http://zendframework.local" target="\_blank">zendframework.local</a>

## Explore
With Nanobox, you have everything you need develop and run your zendframework app:

```bash
# drop into a Nanobox console
nanobox run

# where php is installed,
php -v

# your packages are available,
composer show

# and your code is mounted
ls

# exit the console
exit
```

## Now what?
Whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Add a Database](/php/zendframework/add-a-database)
* [Frontend Javascript](/php/zendframework/frontend-javascript)
* [Local Environment Variables](/php/zendframework/local-evars)
* [Back to Zend Framework overview](/php/zendframework)
