# Local Environment Variables

Environment variables allow you to make certain data available to your app that can vary between environments. In this manner, your app can run in multiple environments without having to be uniquely coded for each. They're also really handy for keeping sensitive information out of your codebase.

When developing locally, environment variables are managed from the Nanobox CLI.

### Add Evars to Your Dev Environment
```bash
# add evars to your dev environment
nanobox dev evar add KEY1=VALUE1,KEY2=VALUE2
```

### View all Dev Evars in Your Dev Environment
```bash
# view evars in your dev environment
nanobox dev evar ls
```

More information is available in the [dev evar](https://docs.nanobox.io/cli/dev/evar) documentation.

#### Pro-Tip: View All Evars
The `dev evar ls` command will display all environment variables created and added by/through Nanobox. Other environment variables do exist and can be viewed when consoled into your dev environment.

```bash
# console into your dev environment
nanobox dev console

# view all evars in your dev container
env
```
