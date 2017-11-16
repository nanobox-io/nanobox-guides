# Preview your App

Nanobox allows you to test your app in a production environment, locally, before you actually launch it into production with `dry-run`.

## Add a preview DNS
Add a convenient way to access your app from the browser:

```bash
nanobox dns add dry-run phoenix.test
```

## dry-run the app

```bash
nanobox deploy dry-run
```

Visit your app at <a href="http://phoenix.test" target="\_blank">http://phoenix.test</a>

With `dry-run` your app will continue to run until stopped (`ctrl + c`). This allows you to to preview it, watch logs, seed data, and troubleshoot.

**HEADS UP**: You can add environment variables to dry-run the same way you do [locally](/elixir/phoenix/local-evars) with `nanobox evar add dry-run KEY=VALUE`.

#### Phoenix 1.3 PORT environment variable

In Phoenix v1.3 and up, the `PORT` environment variable must be set when running in production. Before staging the nanobox app in a `dry-run`, set this variable with:

```bash
nanobox evar add dry-run PORT=8080
```
