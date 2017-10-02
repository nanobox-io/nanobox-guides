# Add a Database

_**PLACEHOLDER:** This whole guide is essentially placeholder content and needs to be replaced with Pyramid-specific content._

## Configure
You can add a database to your app by simply adding a data component to your `boxfile.yml`:

<div class="meta" data-class="snippet" data-optional-components="postgres,mysql,mongo" ></div>

In the above snippet `db` is the unique identifier of this component. It can be anything you choose as long as it is unique.

Nanobox generates the following environment variables based off that name:

* `DATA_DB_HOST` : auto-generated unique host ip
* `DATA_DB_USER` : user to connect with
* `DATA_DB_PASS` : unique password

For databases that require a name, the name will always be `gonano`.

**HEADS UP**: The next time you `nanobox run` your database will be provisioned.

## Connect
Modify your `settings.py` to connect to your app:

```python
DATABASES = {
    'default': {
        'ENGINE': 'pyramid.db.backends.postgresql_psycopg2',
        'NAME': 'gonano',
        'USER': os.environ.get('DATA_DB_USER'),
        'PASSWORD': os.environ.get('DATA_DB_PASS'),
        'HOST': os.environ.get('DATA_DB_HOST'),
        'PORT': '',
    }
}
```

**HEADS UP**: Any database created by nanobox will *always* be named `gonano`

#### Install additional packages
During the `build-runtime` phase, nanobox detects the development libraries your pip packages will need to properly install.

The easiest way to install additional packages, is to add them to your `requirements.txt` and then run `nanobox build-runtime`.

This example is using postgres so you'll need to install the `psycopg2` package:

```bash
# add psycopg2 package to pip installation
echo "psycopg2==2.6.2" >> requirements.txt

#
nanobox build-runtime
```

## Test

#### From an external client
You can connect directly to your database from an <a href="https://docs.nanobox.io/data-management/managing-local-data/" target="\_blank">external client</a>.

#### From Pyramid
You can also test your connection by simply trying to run your app and see if it is able to connect.

```bash
nanobox run python manage.py migrate
```

## Now what?
Whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Frontend Javascript](/python/pyramid/frontend-javascript)
* [Local Environment Variables](/python/pyramid/local-evars)
* [Back to Pyramid overview](/python/pyramid)
