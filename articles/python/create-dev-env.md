# Create a Python Dev Environment

Creating a Python environment and app with Nanobox is done in a few simple steps.

1. [Add a boxfile.yml](#add-a-boxfile-yml)
2. [Up and Running](#up-and-running)

## Add a boxfile.yml
The [`boxfile.yml`](https://docs.nanobox.io/boxfile/) is a yaml config file used to configure your app's runtime and environment. It should be added to the root of your project.

### Specify the Python Engine
In your boxfile.yml, you'll need to set your `engine` to `python`. [Engines](https://docs.nanobox.io/engines) define your code's runtime environment. The Python engine will install Python and associated executables for you.

```yaml
code.build:
  engine: python
```

## Up and Running
With your boxfile.yml in place, you can console into your dev environment. Inside the dev environment you can develop or run your app as you would normally. Your local codebase is mounted into the dev environment so any changes made to your code will be mirrored in the environment.

```yaml
nanobox dev console
```
