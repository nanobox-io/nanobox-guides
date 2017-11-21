# Gin from Scratch
Part of what makes Nanobox so useful is you don't even need Nodejs or Gin installed on your local machine to use them.

## Create a Gin project
Create the project folder and change into it:

```bash
mkdir nanobox-gin && cd nanobox-gin
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

#### Add a boxfile.yml
Nanobox uses a <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> to configure your app's environment.

At the root of your project create a `boxfile.yml` telling Nanobox you want to use the Golang <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a>:

```yaml
run.config:
  engine: golang
  engine.config:
    package: nanobox-gin
```

## Create an Gin App

#### Install Gin

```bash
# drop into a nanobox console
nanobox run

# install gin so you can use it to generate your application
go get gopkg.in/gin-gonic/gin.v1

# exit the console
exit
```

Create a basic Gin app at the root of your project named `main.go`:

```golang
package main

import "gopkg.in/gin-gonic/gin.v1"

func main() {
  r := gin.Default()
  r.GET("/ping", func(c *gin.Context) {
    c.JSON(200, gin.H{
      "message": "pong",
    })
  })
  r.Run() // listen and serve on 0.0.0.0:8080
}
```

## Configure Gin

#### Listen on 0.0.0.0
To allow connections from the host machine into the app's container, your app needs to listen on all available IP's (0.0.0.0). Gin does this by default, and so no additional configuration is needed.

## Add a local DNS
Add a convenient way to access your app from the browser:

```bash
nanobox dns add local gin.local
```

## Run the app

```bash
nanobox run go run main.go
```

Visit your app at <a href="http://gin.local:8080/ping" target="\_blank">gin.local:8080/ping</a>

## Explore
With Nanobox, you have everything you need develop and run your gin app:

```bash
# drop into a Nanobox console
nanobox run

# where go is installed,
go version

# git is installed,
git --version

# and your code is mounted
ls

# exit the console
exit
```

## Now what?
Whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Add a Database](/golang/gin/add-a-database)
* [Frontend Javascript](/golang/gin/frontend-javascript)
* [Local Environment Variables](/golang/gin/local-evars)
* [Back to Gin overview](/golang/gin)
