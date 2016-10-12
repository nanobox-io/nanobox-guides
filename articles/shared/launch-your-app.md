# Launch Your App
Once your app has been [staged and tested in sim](../stage-your-app), you can feel comfortable knowing it will work in production.

This guide is broken down into three sections:

1. [Add a Hosting Provider](#add-a-hosting-provider)
2. [Launch a New App](#launch-a-new-app)
3. [Deploy Your App](#deploy-your-app)

If you don't already have an account with [Nanobox](https://dashboard.nanobox.io), you'll need to create one.

## Add a Hosting Provider
Nanobox provisions and deploys your app on your hosting provider. Before you can create an app, you'll need to add a hosting provider in your dashboard. To add one, go to your account admin under [hosting accounts](https://dashboard.nanobox.io/users/provider_accounts).

## Launch a New App
New apps are launched from your [app dashboard](https://dashboard.nanobox.io). Nanobox will provision a [bunkhouse server](https://docs.nanobox.io/scaling/bunkhouse) on your hosting provider.

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

## Now what?
With a production app launched, what's next? Think about what else your application might need and hopefully the topics below will help you get started with the next steps of your development!

* Add additional components
* Pointing your domain
* Add SSL/TLS encryption
* Add custom environment variables
* [Next Steps](overview.html)
* [Back to rails overview](overview.html)
