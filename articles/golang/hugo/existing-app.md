# Existing Hugo App
Part of what makes nanobox so useful is you don't even need golang or hugo installed on your local machine to use them.

This guide outlines the process used to create the <a href="https://github.com/nanobox-quickstarts/nanobox-hugo" target="\_blank">nanobox-hugo</a> quickstart app found under <a href="https://github.com/nanobox-quickstarts" target="\_blank">nanobox-quickstarts</a> on github.

## Build a Golang Dev Environment
Nanobox creates an isolated virtual environment for your app, mounting the app's codebase inside.

From within this environment you can develop and run your app as you normally would with things like `go get` or `go build`.

#### Change into your project directory
Make sure to change directories into your project at this point, as all `nanobox` commands will be run from the root of your project.

#### Add a boxfile.yml
The <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> tells nanobox how to build and configure your app's environment. At the root of your project create a `boxfile.yml` telling nanobox you want to use the static <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a> (a set of scripts that configure an environment):

```yaml
run.config:

  # use the static engine
  engine: static
  engine.config:

    # tell the engine where to serve static assets from
    rel_dir: public

  # enable file watching for live reload
  fs_watch: true

  # install hugo
  extra_steps:
    - bash ./install.sh

deploy.config:

  # generate site on deploy
  extra_steps:
    - hugo
```

#### Install Hugo
Nanobox uses Docker to create instant, isolated, development environments. Because of this, you’ll need to make sure that during development you have Hugo available.

Do this by adding a custom install script at the root of your project that will install Hugo automatically for you:

```bash
#!/bin/bash

if [[ ! -f /data/bin/hugo ]]; then
  cd /tmp
  wget https://github.com/gohugoio/hugo/releases/download/v0.25.1/hugo_0.25.1_Linux-64bit.tar.gz
  tar -xzf hugo_0.25.1_Linux-64bit.tar.gz
  mv hugo /data/bin/hugo
  cd -
  rm -rf /tmp/*
fi
```

#### Start the Environment
You can then start the dev environment:

```bash
nanobox run
```

#### Configure your Hugo app
Add a convenient way to access your app from a browser:

```bash
nanobox dns add local hugo.local
```

## Hugo up-and-running
To view your application simply run the following command from a Nanobox console:

```bash
hugo server --bind="0.0.0.0" --baseUrl=$APP_IP
```

Once the app has started you can visit it from your favorite browser at `hugo.local:1313`.

## Now what?
With an app running in a dev environment with nanobox, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Add a Database](/golang/hugo/next-steps/add-a-database)
* [Javascript Runtime](/golang/hugo/next-steps/javascript-runtime)
* [Local Environment Variables](/golang/hugo/next-steps/local-evars)
* [Back to Hugo overview](/golang/hugo)
