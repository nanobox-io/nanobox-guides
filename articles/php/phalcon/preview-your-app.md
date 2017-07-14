# Preview your App

Nanobox allows you to test your app in a production environment, locally, before you actually launch it into production with `dry-run`.

## Add a preview DNS
Add a convenient way to access your app from the browser:

```bash
nanobox dns add dry-run phalcon.preview
```

## dry-run the App

```bash
nanobox deploy dry-run
```

Visit your app at <a href="http://phalcon.preview" target="\_blank">http://phalcon.preview</a>

With `dry-run` your app will continue to run until stopped (`ctrl + c`). This allows you to to preview it, watch logs, seed data, and troubleshoot.

**HEADS UP**: You can add environment variables to dry-run the same way you do [locally](/php/phalcon/local-evars) with `nanobox evar add dry-run KEY=VALUE`.
