# Preview your App

Nanobox allows you to test your app in a production environment, locally, before you actually launch it into production with `dry-run`.

## Add a preview DNS
Add a convenient way to access your app from the browser:

```bash
nanobox dns add dry-run django.preview
```

**HEADS UP**: You'll need to add `django.preview` to the list of `ALLOWED_HOSTS` in `app/settings.py`

## dry-run the app

```bash
nanobox deploy dry-run
```

Visit your app at <a href="http://django.preview" target="\_blank">http://django.preview</a>

With `dry-run` your app will continue to run until stopped (`ctrl + c`). This allows you to to preview it, watch logs, seed data, and troubleshoot.

**HEADS UP**: You can add environment variables to dry-run the same way you do [locally](/python/django/local-evars) with `nanobox evar add dry-run KEY=VALUE`.
