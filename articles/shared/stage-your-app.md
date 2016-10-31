# Stage Your App

Setting up staging environments identical to your production environment can be challenging and time-consuming. Nanobox provides a simulated production environment in which you can stage a full production deploy and test your app in an environment identical to your production environment.

## Deploy into Sim

```bash
# start your sim environment
nanobox sim start

# add a convenient way to access your sim app
nanobox sim dns add app-name.nanobox.sim

# deploy the app into the sim environment
nanobox sim deploy
```

In the deploy process, all app components are provisioned and started. Once the deploy is complete, you will be able to access and test your app at `http://app-name.nanobox.sim`.
