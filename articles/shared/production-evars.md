# Production Environment Variables

Environment variables (evars) allow you to make certain data available to your app that can vary between environments. In this manner, your app can run in multiple environments without having to be uniquely coded for each. They're also really handy for keeping sensitive information out of your codebase.

## Adding Evars in Production
When working with a production app, environment variables can be added from either the Nanobox CLI or your app's dashboard.

### From the Nanobox CLI
The `evar add` command adds environment variables to your production app. Pass key-value pairs for your environment variables. Multiple evars can be added at once using a comma separated list of key-value pairs.

```bash
# add evars to your production app
nanobox evar add KEY1=VALUE1,KEY2=VALUE2
```

More information about the `evar` command is available in the [`evar` documentation](https://docs.nanobox.io/cli/evar/).

### In Your Dashboard
Environment variables can be added in your dashboard under Config > Environment Variables.

![Adding Environment Variables in Your Dashboard](/assets/shared/adding-evars-dashboard.png)

#### Pro-Tip: View All Evars
The `evar ls` command will display all environment variables created and added by/through Nanobox. Other environment variables do exist and can be viewed when consoled into a production web/worker component.

```bash
# console into your dev environment
nanobox console web.name

# view all evars in your dev container
env
```
