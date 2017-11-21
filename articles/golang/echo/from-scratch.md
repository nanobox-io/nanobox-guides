# Echo from Scratch
Part of what makes Nanobox so useful is you don't even need Nodejs or Echo installed on your local machine to use them.

## Create a Echo project
Create the project folder and change into it:

```bash
mkdir nanobox-echo && cd nanobox-echo
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

#### Add a boxfile.yml
Nanobox uses a <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> to configure your app's environment.

At the root of your project create a `boxfile.yml` telling Nanobox you want to use the Nodejs <a href="https://docs.nanobox.io/enechoes/" target="\_blank">enechoe</a>:

```yaml
run.config:
  enechoe: golang
  enechoe.config:
    package: nanobox-echo
```

## Create an Echo App

#### Install Echo

```bash
# drop into a nanobox console
nanobox run

# install echo so you can use it to generate your application
go get -u github.com/labstack/echo

# exit the console
exit
```

Create a basic Echo app at the root of your project named `server.go`:

```golang
package main

import (
	"net/http"

	"github.com/labstack/echo"
)

func main() {
  e := echo.New()
  e.GET("/", func(c echo.Context) error {
    return c.String(http.StatusOK, "Hello, World!")
  })
  e.Logger.Fatal(e.Start(":1323"))
}
```

## Configure Echo

#### Listen on 0.0.0.0
To allow connections from the host machine into the app's container, your app needs to listen on all available IP's (0.0.0.0). Echo does this by default, and so no additional configuration is needed.

## Add a local DNS
Add a convenient way to access your app from the browser:

```bash
nanobox dns add local echo.local
```

## Run the app

```bash
nanobox run go run server.go
```

Visit your app at <a href="http://echo.local:1323" target="\_blank">echo.local:1323</a>

## Explore
With Nanobox, you have everything you need develop and run your echo app:

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

* [Add a Database](/golang/echo/add-a-database)
* [Frontend Javascript](/golang/echo/frontend-javascript)
* [Local Environment Variables](/golang/echo/local-evars)
* [Back to Echo overview](/golang/echo)
