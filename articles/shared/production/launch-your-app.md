# Launch Your App
Once your application (app) has been [prepared for production](preparing-for-prduction.html) you can feel comfortable knowing it will work in production, all you need to do now is hook it up.

This guide is broken down into three sections:

1. [Add a Hosting Provider](#add-a-hosting-provider)
2. [Launch your app](#launch-your-app)
3. [Deploy your app](#deploy-your-app)

If you don't already have an account with [Nanobox](https://dashboard.nanobox.io), you'll need to create one.

## Add a Hosting Provider
**Before you can create an app**, you'll need to add a hosting provider. Go to your account admin under [hosting accounts](https://dashboard.nanobox.io/users/provider_accounts) and add one.

## Launch a New App
Once you have a hosting provider, go back to your [app dashboard](https://dashboard.nanobox.io) and launch a new app. Nanobox will provision a [bunkhouse server](https://docs.nanobox.io/scaling/bunkhouse) on your hosting provider.

![Launch an App](/assets/shared/production/app-launch-button.png)

## Deploy Your App
With an app created, you're ready to deploy your runtime and code. From your app's root directory, run the following:

```bash
# login to your Nanobox account
nanobox login

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
