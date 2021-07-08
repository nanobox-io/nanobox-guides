# Iris from Scratch
Part of what makes Nanobox so useful is you don't even need Golang or Iris installed on your local machine to use them.

## Create a Iris project
Create the project folder and change into it:

```bash
mkdir nanobox-iris && cd nanobox-iris
```

**HEADS UP**: All `nanobox` commands *must* be run from within your project folder.

#### Add a boxfile.yml
Nanobox uses a <a href="https://docs.nanobox.io/boxfile/" target="\_blank">boxfile.yml</a> to configure your app's environment.

At the root of your project create a `boxfile.yml` telling Nanobox you want to use the Golang <a href="https://docs.nanobox.io/engines/" target="\_blank">engine</a>:

```yaml
run.config:
  engine: golang
  engine.config:
    package: nanobox-iris
```

## Create an Iris App

#### Install Iris

```bash
# drop into a nanobox console
nanobox run

# install iris so you can use it to generate your application
go get -u github.com/kataras/iris

# exit the console
exit
```

Create a basic Iris app at the root of your project named `main.go`:

```golang
package main

import "github.com/kataras/iris"

func main() {
  app := iris.New()

  tmpl := iris.HTML("./templates", ".html")
  app.RegisterView(tmpl)

  app.Get("/hi", hi)

  app.Run(iris.Addr(":8080"))
}

func hi(ctx iris.Context) {
  ctx.ViewData("Name", "iris")
  ctx.View("hi.html")
}
```

Create a new html page for your application at `./templates/hi.html`:

```html
<html><head> <title> Hi {{.Name}}</title> </head>
  <body>
    <h1> Hi {{.Name}} </h1>
  </body>
</html>
```

## Configure Iris

#### Listen on 0.0.0.0
To allow connections from the host machine into the app's container, your app needs to listen on all available IP's (0.0.0.0). Iris does this by default, and so no additional configuration is needed.

## Add a local DNS
Add a convenient way to access your app from the browser:

```bash
nanobox dns add local iris.local
```

## Run the app

```bash
nanobox run go run main.go
```

Visit your app at <a href="http://iris.local:8080/hi" target="\_blank">iris.local:8080/hi</a>

## Explore
With Nanobox, you have everything you need develop and run your iris app:

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

* [Add a Database](/golang/iris/add-a-database)
* [Frontend Javascript](/golang/iris/frontend-javascript)
* [Local Environment Variables](/golang/iris/local-evars)
* [Back to Iris overview](/golang/iris)
