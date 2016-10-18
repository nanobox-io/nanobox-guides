# Launch Your App
Once your app has been [staged and tested in sim](stage-your-app), you can feel comfortable knowing it will work in production.

Before you can launch your app, if you don't already have an account with <a href="https://dashboard.nanobox.io" target="\_blank">Nanobox</a>, you'll need to create one.

## Add a Hosting Provider
Nanobox provisions and deploys your app on your hosting provider. Before you can create an app, you'll need to add a hosting provider in your dashboard. To add one, go to your account admin under <a href="https://dashboard.nanobox.io/users/provider_accounts" target="\_blank">hosting accounts</a>.

## Launch a New App
New apps are launched from your <a href="https://dashboard.nanobox.io" target="\_blank">app dashboard</a>. When launching a new app, nanobox will provision a <a href="https://docs.nanobox.io/scaling/bunkhouse" target="\_blank">bunkhouse server</a> on your hosting provider.

![Launch an App](/assets/shared/app-launch-button.png)

## Deploy Your App
With an app created, you're ready to deploy your runtime and code. From your app's root directory, run the following:

```bash
# login to your Nanobox account
nanobox login

# compile your code (if you haven't already)
nanobox compile

# link your local codebase to your live app
nanobox link app-name

# deploy to production
nanobox deploy
```
