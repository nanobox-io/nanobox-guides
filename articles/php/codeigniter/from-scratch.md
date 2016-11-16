# Codigniter from Scratch
Part of what makes Nanobox so useful is you don't even need PHP or codeigniter installed on your local machine to use them.

## Create a Codigniter project

#### Create a Codigniter project folder
Create a project folder and change into it

```bash
mkdir nanobox-codeigniter && cd nanobox-codeigniter
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

### Add a boxfile.yml
The [boxfile.yml](https://docs.nanobox.io/boxfile/) tells Nanobox how to build and configure your environment. Create a `boxfile.yml` at the root of your project that contains the following:

```yaml
run.config:
  # install php and associated runtimes
  engine: php
  # php engine configuration (php version, extensions, etc)
  engine.config:
    # sets the php version to 7.0
    runtime: php-7.0
```

## Generate a Codeigniter App

#### Install Codeigniter

To install codeigniter, we're gonna download the framework, unzip it into a temporary location, and then copy it into our app:

```bash
# drop into a nanobox console
nanobox run

# install unzip package
pkgin in -y unzip

# cd into a temporary directory
cd /tmp

# download codeigniter
wget https://github.com/bcit-ci/CodeIgniter/archive/3.1.2.zip

# unzip codeigniter
unzip 3.1.2.zip

# cd back into the /app dir
cd -

# copy the framework into the project
cp -a /tmp/CodeIgniter-3.1.2/* .

# exit the console
exit
```

#### Add a local DNS
Add a convenient way to access your app from the browser

```bash
nanobox dns add local codeigniter.dev
```

## Run the app

```bash
nanobox run php-server
```

Visit your app -> [codeigniter.dev](http://codeigniter.dev)

## Explore
With Nanobox, you have everything you need develop and run your codeigniter app:

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

* [Add a Database](/php/codeigniter/add-a-database)
* [Frontent Javascipt](/php/codeigniter/frontend-javascript)
* [Local Environment Variables](/php/codeigniter/local-evars)
* [Back to Codeigniter overview](/php/codeigniter)
