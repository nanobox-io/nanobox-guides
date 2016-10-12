# Managing Production Data
To establish a secure remote connection to your production component, use the Nanobox CLI's [`tunnel` command](https://docs.nanobox.io/cli/tunnel/). This will bind to a local port and establish a secure tunnel to your live Memcached component.

#### Open a Tunnel to Memcached
```bash
nanobox tunnel data.memcached
```

The tunnel command will output the port to which it is bound. Connection credentials for the tunnel are provided in your app dashboard under the "Connect" section of your Memcached component.

![Memcached Tunnel Connection Credentials](/assets/memcached/tunnel-creds.png)

**Note:** Because the tunnel is bound to a port on your local machine, `127.0.0.1` is the host to which you connect.

## Use telnet to Connect
Use `telnet` to connect to the tunnel-bound port on your local machine. You can then use the [telnet commands](https://github.com/memcached/memcached/wiki/Commands) to manage your data.

```bash
# Connect to memcached with telnet
telnet 127.0.0.1 11211
```
