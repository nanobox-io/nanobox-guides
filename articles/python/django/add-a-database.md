# Add a Database
Nanobox apps are comprised of
<a href="https://docs.nanobox.io/getting-started/add-components/" target="\_blank">components</a> (docker images configured for nanobox). Components are added to apps via the `boxfile.yml`, making adding a database for your app to connect to effortless.

## Add a data component
To add a database to your app, simply add a data component to your `boxfile.yml`:

```yaml
code.build:
  engine: "python"

# for this example we're going to add a postgres database
data.db:
  image: nanobox/postgresql
```

In the above snippet `db` is the name of this component (and can be anything you choose); it is used as a unique identifier and when generating <a href="https://docs.nanobox.io/app-config/environment-variables/" target="\_blank">environment variables</a>. `image` can be any docker image configured for nanobox.

#### Apply changes
With these options added to your `boxfile.yml`, the next time you start a `nanobox dev console` the database will be running.

## Connect your app
When a data component is provisioned with nanobox, environment variables are generated along with unique connection credentials.

#### Environment Variables
From the `boxfile.yml` snippet above, the component type (data) and the unique ID (db) make up the `component ID`.

Environment variables are generated from the `component ID`:

```bash
DATA_DB_HOST = <your-components-ip>
DATA_DB_USER = nanobox
DATA_DB_PASS = <unique-password>
```

#### Connection Credentials
Modify your `myapp/settings.py` to connect to your app:

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'gonano',
        'USER': os.environ['DATA_DB_USER'],
        'PASSWORD': os.environ['DATA_DB_PASS'],
        'HOST': os.environ['DATA_DB_HOST'],
        'PORT': '',
    }
}
```

#### Add pip dependency
If you are connecting to a third party service, you'll need a python extension to connect to the service. During the `build-runtime` phase, nanobox detects the development libraries your pip packages will need to properly install. The easiest way to install a dependency, is to add it to your `requirements.txt` and then running `nanobox build-runtime`, like this:

```bash
# add psycopg2 package to pip installation
echo "psycopg2==2.6.2" >> requirements.txt

# rebuild the runtime with the postgres client
nanobox build-runtime
```

## Test the connection
With your data component provisioned, and your app updated to connect to it, it's time to test that connection, which can do this in one of several ways.

#### Connect an external client
You can test your connection by connecting an external client to your database using your apps <a href="https://docs.nanobox.io/local-dev/managing-local-data/" target="\_blank">connection credentials</a>.

#### From within your app
You can also test your connection by simply trying to run your app and see if it is able to connect. From the `nanobox dev console` run the following command:

```bash
python manage.py migrate
```

## Now what?
With your app connected to a database, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Javascript Runtime](/python/django/javascript-runtime)
* [Local Environment Variables](/python/django/local-evars)
* [Prepare for Production](/python/django/configure-django)
* [Back to Django overview](/python/django)
