# CakePHP from Scratch
Part of what makes Nanobox so useful is you don't even need PHP or CakePHP installed on your local machine to use them.

## Create a CakePHP project
Create a project folder and change into it:

```bash
mkdir nanobox-cakephp && cd nanobox-cakephp
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

### Add a boxfile.yml
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
    # set the apache/nginx document root to public
    document_root: webroot
    # enables php extensions
    extensions:
      - pdo
      - mbstring
      - intl
      - tokenizer
      - session
      - zip
      - dom
      - xml
      - ctype
      - xmlwriter
  
```

## Generate a CakePHP App

```bash
# drop into a nanobox console
nanobox run

# cd into a temporary directory
cd /tmp

# generate a CakePHP skeleton app
composer create-project --prefer-dist cakephp/app cakephp_app

# cd back into the /app dir
cd -

# copy the framework into the project
cp -a /tmp/cakephp_app/* .

# exit the console
exit
```

## Add a local DNS
Add a convenient way to access your app from the browser

```bash
nanobox dns add local cakephp.dev
```

## Run the app

```bash
nanobox run php-server
```

Visit your app at <a href="http://cakephp.dev" target="\_blank">cakephp.dev</a>

## Explore
With Nanobox, you have everything you need develop and run your cakephp app:

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

* [Add a Database](/php/cakephp/add-a-database)
* [Frontend Javascript](/php/cakephp/frontend-javascript)
* [Local Environment Variables](/php/cakephp/local-evars)
* [Back to CakePHP overview](/php/cakephp)
