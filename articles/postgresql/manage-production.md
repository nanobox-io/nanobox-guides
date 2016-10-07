# Managing Production Data
To establish a secure remote connection to your production database, use the Nanobox CLI's [`tunnel` command](https://docs.nanobox.io/cli/tunnel/). This will bind to a local port and establish a secure tunnel to your live PostgreSQL component.

#### Open a Tunnel to PostgreSQL
```bash
$ nanobox tunnel data.postgres
```

The tunnel command will output the port to which it is bound. Connection credentials for the tunnel are provided in your app dashboard under the "Connect" section of your PostgreSQL component.

![PostgreSQL Tunnel Connection Credentials](/assets/postgresql/tunnel-creds.png)

**Note:** Because the tunnel is bound to a port on your local machine, `127.0.0.1` is the host to which you connect.

## Use Your Client of Choice to Connect
Use the tunnel-bound port on your local machine and the tunnel credentials provided in your dashboard to connect with your PostgreSQL client or GUI of choice.
