# Importing Data

## Into a Dev or Sim Database
Nanobox makes MySQL databases running in dev and sim environments accessible to your local machine through a specific IP and port. You can use these along with the database's username(s) and password(s) to connect.

### Make Sure Dev/Sim is Running
Whatever environment you'd like to import data needs to be running before you'll be able to connect to MySQL. If it's not, simply run the `start` command.

```bash
# Starts a dev environment
$ nanobox dev start

# Starts a sim environment
$ nanobox sim start
```

### Get Your Database Credentials
To get the credentials of your MySQL database, run the `info` command. This will output information for each of your app's components.

```bash
# List dev app info
$ nanobox dev info

# List sim app info
$ nanobox sim info
```

Find your MySQL data component in the info output.

```bash
...

data.db
  IP      : 192.168.99.65
  User(s) :
    root - paSsW0rD
    nanobox - PAsSw0Rd

...
```

**Name:** The database name will always be 'gonano'.  
**Host:** The IP of your MySQL data component.  
**Port:** 3306, the default MySQL port.  
**User:** You can use either the 'nanobox' or 'root' user.  
**Password:** The password provided for whichever user you use.

### Connect to MySQL Using the Provided Credentials
With the database credentials you can use your MySQL client of choice to import your data. These include but are not limited to the MySQL CLI, Sequel Pro, MySQL Workbench, HeidiSQL, etc. The import process is different for each client, so you'll need to reference your client's documentation on importing data.

Below is an example of importing data using the MySQL CLI.

```bash
$ mysql -h 192.168.99.65 -P 3306 -u nanobox -pPAsSw0Rd gonano < path/to/data_dump.sql
```

## Into a Production Database
To ensure data security, databases in production Nanobox apps are accessible only through secure tunnels established through the Nanobox CLI's `tunnel` command. These tunnels bind to and listen on a local port. To establish a secure tunnel run the `tunnel` command, passing in your your MySQL data component as the tunnel endpoint.

```bash
$ nanobox tunnel data.db
```

To view your tunnel connection credentials, go to your dashboard and click the "Connect" button below your database component. *In a new app, your database will be nested under "App Components"*

![Tunnel Credentials](/assets/php/wordpress/wordpress-tunnel-credentials.png)

### Connect to MySQL Using the Tunnel Credentials
Use the credentials provided in your dashboard and the port on which the tunnel is listening to connect with your MySQL client of choice to import your data. These include, but are not limited to, the MySQL CLI, Sequel Pro, MySQL Workbench, HeidiSQL, etc. The import process is different for each client, so you'll need to reference your client's documentation on importing data.

Below is an example of importing data using the MySQL CLI.

```bash
$ mysql -h 127.0.0.1 -P 3306 -u nanobox -pPAsSw0Rd gonano < path/to/data_dump.sql
```

## Update Your WordPress BaseURL
As you move data between environments, you'll need to update the WordPress baseURL stored in your database. If you don't, permalinks won't work properly. They'll all go to the wrong URL. You likely won't even be able to access your WP Admin panel.

Connect to your database and run query below to update all the necessary tables. Be sure to update the `old_url` and `new_url` variables in the query to be your old and new URLs.

```sql
SET @old_url = 'http://your-old-domain.com';
SET @new_url = 'http://your-new-domain.com';
UPDATE wp_options
  SET option_value = @new_url
  WHERE option_name = 'siteurl'
    OR option_name = 'home';
UPDATE wp_posts
  SET guid = REPLACE(
      guid
    , @old_url
    , @new_url);
UPDATE wp_posts
  SET post_content = REPLACE(
      post_content
    , @old_url
    , @new_url)
  WHERE post_type = 'post';
```
