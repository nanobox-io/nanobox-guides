# Create a Ruby Dev Environment

Creating a Ruby environment and app with Nanobox is done in a few simple steps.

1. [Add a boxfile.yml](#add-a-boxfile-yml)
2. [Up and Running](#up-and-running)

## Add a boxfile.yml
The [`boxfile.yml`](https://docs.nanobox.io/boxfile/) is a yaml config file used to configure your app's runtime and environment. It should be added to the root of your project.

### Specify the Ruby Engine
In your boxfile.yml, you'll need to set your `engine` to `ruby`. [Engines](https://docs.nanobox.io/engines) define your code's runtime environment. The Ruby engine will install Ruby and associated executables for you.

```yaml
code.build:
  engine: ruby
```

## Up and Running
With your boxfile.yml in place, you're ready to build your runtime, start your development environment (dev), and console in.

```yaml
# build your runtime
nanobox build

# start your dev environment and console in
nanobox dev console
```

This will drop you into an interactive console inside your virtualized dev environment on your local machine. You can bundler or start your app. Your local codebase is mounted into your dev container so any changes made to your code will apply to your dev environment.
