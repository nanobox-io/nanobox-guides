# Add a Database
Nanobox apps are comprised of <a href="https://docs.nanobox.io//add-components/" target="\_blank">components</a> (docker images configured for nanobox). Components are added to apps via the `boxfile.yml`, making adding a database for your app to connect to effortless.

## Add a data component
To add a database to your app, simply add a data component to your `boxfile.yml`:

```yaml
code.build:
  engine: "ruby"

# for this example we're going to add a postgres database
data.db:
  image: nanobox/postgresql
```

In the above snippet `db` is the name of this component (and can be anything you choose); it is used as a unique identifier and when generating <a href="https://docs.nanobox.io/app-config/environment-variables/" target="\_blank">environment variables</a>. `image` can be any docker image configured for nanobox.

#### Provision the database
To provision your database, simply deploy the `boxfile.yml` changes to the dev environment:

```bash
`nanobox dev deploy`
```

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
Before connecting to the database you'll need to create a few files.

At the root of your project, create a `Rakefile` and a `config` folder with a `database.yml` and `environment.rb` inside.

The `Rakefile` should look like this:
```rake
require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
require './myapp'
```

The `database.yml` file should look like this:
```yaml
development:
  adapter: postgresql
  encoding: unicode
  database: development
  host: <%= ENV['DATA_DB_HOST'] %>
  username: <%= ENV['DATA_DB_USER'] %>
  password: <%= ENV['DATA_DB_PASS'] %>
```

The `environment.rb` file should look like this:
```ruby
#The environment variable DATABASE_URL should be in the following format:
# => postgres://{user}:{password}@{host}:{port}/path
configure :production, :development do
	db = URI.parse(ENV['DATABASE_URL'] || 'postgres://<component-ip>/db')

	ActiveRecord::Base.establish_connection(
		:adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
		:host     => db.host,
		:username => db.user,
		:password => db.password,
		:database => db.path[1..-1],
		:encoding => 'utf8'
	)
end
```

#### Update dependencies
There are a few more dependencies our app has how that we're connecting a database. Update the `Gemfile` with the following gems and run `bundle install`:

```ruby
gem "activerecord"
gem "sinatra-activerecord"
gem "pg"
```

## Test the connection
With your data component provisioned, and your app updated to connect to it, it's time to test that connection, which can do this in one of several ways.

#### Connect an external client
You can test your connection by connecting an external client to your database using your apps <a href="https://docs.nanobox.io/local-dev/managing-local-data/" target="\_blank">connection credentials</a>.

#### From within your app
You can also test your connection by simply trying to run your app and see if it is able to connect. From the `nanobox dev console` run the following command:

```bash
ruby myapp.rb
```

## Now what?
With your app connected to a database, whats next? Think about what else your app might need and hopefully the topics below will help you get started with the next steps of your development!

* [Javascript Runtime](/ruby/sinatra//javascript-runtime)
* [Local Environment Variables](/ruby/sinatra//local-evars)
* [Prepare for Production](/ruby/sinatra//configure-sinatra)
* [Back to Sinatra overview](/ruby/sinatra)
