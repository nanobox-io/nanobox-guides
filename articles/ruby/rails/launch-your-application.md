# Rails: Launch your application
Once your application (app) has been [prepared for production](preparing-for-prduction.html) you can feel comfortable knowing it will work in production, all you need to do now is hook it up.

This guide is broken down into three sections:

1. [Add a service provider](adding-a-service-provider)
2. [Launch your app](launch-your-app)
3. [Deploy your app](deploy-your-app)

## Add a service provider
If you don't already have an account with [nanobox](//dashboard.nanobox.io), you'll need to create one. After you've logged in to your account, **before you can create an app**, you'll need to add a hosting provider. Go to your account admin under [hosting providers](//dashboard.nanobox.io/users/provider_accounts) and add one.

## Launching your app
Once you have a hosting provider, go back to your [apps dashboard](//dashboard.nanobox.io) and launch a new app. After you've completed the process for launching a new app. Wait while Nanobox provisions your app on your service provider.

## Deploy you app
Now that your app is created on Nanobox, all thats left is to deploy to your app. From your apps root directory run the following:

```bash
# login to your Nanobox account
nanobox login

# tell nanobox which app (or apps) on Nanobox you want to deploy to; you can have
# a one to many relationship between your local application and production apps.
nanobox link add <name-of-production-app> -a <alias-of-local-app>

# deploy to production
nanobox deploy <alias-of-local-app>
```

## Now what?
With a production app launched using nanobox whats next? Think about what else your application might need and hopefully the topics below will help you get started with the next steps of your development!

* Add additional components
* Pointing your domain
* Add SSL/TLS encryption
* Add custom environment variables
* [Next Steps](overview.html)
* [Back to rails overview](overview.html)
