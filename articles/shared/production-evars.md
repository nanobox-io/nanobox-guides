# Production Environment Variables

Environment variables allow your app to run in multiple environments without modifying the code. They're also really handy for keeping sensitive information out of your codebase.

## Add
When working with a production app, environment variables can be added from either the Nanobox CLI or your app's dashboard.

### From the Nanobox CLI
The `evar add` and `evar load` commands add environment variables to your production app. Pass key-value pairs for your environment variables or a file containing key-value pairs. Multiple evars can be added at once using a space-delimited list of key-value pairs.

```bash
# add evars to your production app
nanobox evar add KEY1=VALUE1 KEY2=VALUE2

# add evars from a file to your production app
nanobox evar load path/to/evar-file
```

_More information is available in the [`evar` command documentation](https://docs.nanobox.io/cli/evar/)._

### From Your Dashboard
Environment variables can be added in your dashboard under Config > Environment Variables.

![Adding Environment Variables in Your Dashboard](/assets/shared/adding-evars-dashboard.png)
