# Add a Database

## Configure
You can add a database to your app by simply adding a data component to your `boxfile.yml`:

<div class="meta" data-class="snippet" data-optional-components="postgres,mysql,mongo" ></div>

In the above snippet `db` is the unique identifier of this component. It can be anything you choose as long as it is unique.

Nanobox generates the following environment variables based off that name:

* `DATA_DB_HOST` : auto-generated unique host ip
* `DATA_DB_USER` : user to connect with
* `DATA_DB_PASS` : unique password

For databases that require a name, the name will always be `gonano`.

**HEADS UP**: Your database will be running the next time you `nanobox run`.

## Connect
However you choose to configure your connection, you can access the following environment variables:

```python
import os

user    = os.environ.get('DATA_DB_USER')
passwd  = os.environ.get('DATA_DB_PASS')
host    = os.environ.get('DATA_DB_HOST')
```

#### Add dependency
If you are connecting to a third party service, you'll need a python extension to connect to the service. During the `build-runtime` phase, nanobox detects the development libraries your pip packages will need to properly install.

The easiest way to install a dependency, is to add it to your `requirements.txt` and then running `nanobox build-runtime`, like this:

```bash
# add psycopg2 package to pip installation
echo "psycopg2==2.6.2" >> requirements.txt

# rebuild the runtime with the postgres client
nanobox build-runtime
```

## Test

#### From an external client
You can connect directly to your database from an <a href="https://docs.nanobox.io/data-management/managing-local-data/" target="\_blank">external client</a>.

#### From Python
Your can also test the connection directly from your app:

```bash
nanobox run python YOURAPP.py
```

## Now what?
Whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Frontend Javascript](/python/generic/frontend-javascript)
* [Local Environment Variables](/python/generic/local-evars)
* [Back to Python overview](/python/generic/)
