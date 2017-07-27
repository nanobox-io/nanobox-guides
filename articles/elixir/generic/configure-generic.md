# Configure Phoenix for Production

## Port configuration
Your app's router will handle http and SSL/TLS encryption, and then forward the connection to your app at port 8080. You'll need to ensure your app is listening on port 8080.

**HEADS UP**: If your app serves non-http protocols such as tcp or udp, you can configure nanobox to forward those protocols as well. For additional information, please refer to the [Port Mapping](https://docs.nanobox.io/boxfile/web/#port-mapping) documentation.


## Add a web component
For your app to run in production, at the very least you'll need a [web component](https://docs.nanobox.io/boxfile/web/).

The Elixir engine provides a `node-start` helper script that ensures all nodes in an Elixir cluster have the necessary credentials to communicate with each other. You should always prefix your web component's start command with `node-start`.

```yaml
web.main:
  start: node-start mix run
```

In the above snippet `main` is the name of web component and can be anything you choose (it is only used as a unique identifier).

## Now what?
With your app configured for running in production, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Preview your App](/elixir/phoenix/preview-your-app)
* [Launch your App](/elixir/phoenix/launch-your-app)
* [Back to Phoenix overview](/elixir/phoenix)
