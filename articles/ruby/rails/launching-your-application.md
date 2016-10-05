# Rails: Connecting a Database
With your application running in `sim` you can feel comfortable knowing it will work in production, all you need to do now is hook it up.

The guide is broken down into three sections:

1. [Adding a service provider](adding-a-service-provider)
2. [Launch your app](launch-your-app)
3. [Deploy your app](deploy-your-app)

## Adding a service provider
To launch your app into production you'll first need to create it on [nanobox](//dashboard.nanobox.io). After you've logged in to your nanobox account, before you can create an app you'll need to add a provider account. Go to your account admin under [hosting providers](//dashboard.nanobox.io/users/provider_accounts) and add a new provider.

## Launching your app
After you've added your provider go back to your [apps dashboard]() and [launch a new app](). After you've completed the process for launching a new app wait while Nanobox provisions your app on your service provider.

## Deploy you app
Now that your app is created on Nanobox, all thats left is to deploy to your app. From your apps root directory run the following:

```bash
# you need to login to your Nanobox account
nanobox login

# tell nanobox which app (or apps) on Nanobox you want to deploy to; you can have
# one to many relationship between your local application and production apps.
nanobox link add <name-of-production-app> -a <alias-of-local-app>

# deploy to production
nanobox deploy
```

## Now what?
Now that you have a database connected to your application whats next? Think about what else your application might need and hopefully the topics below will help you get started with the next steps of your development!

* Adding additional components
* Pointing your domain
* Adding SSL/TLS encryption
* Adding custom environment variables
* What I don't know I need to know
* Troubleshooting
* Intermediate Topics
* Advanced Topics
