# Managing Production Data
To establish a secure remote connection to your production component, use the Nanobox CLI's [`tunnel` command](https://docs.nanobox.io/cli/tunnel/). This will bind to a local port and establish a secure tunnel to your live Memcached component.

#### Open a Tunnel to Memcached
```bash
$ nanobox tunnel data.memcached
```

The tunnel command will output the port to which it is bound. Since it's a local port, you'll need to use `127.0.0.1` as your host.

## Use telnet to Connect
Use `telnet` to connect to the tunnel-bound port on your local machine. You can then use the [telnet commands](https://github.com/memcached/memcached/wiki/Commands) to manage your data.

```bash
# Connect to memcached with telnet
telnet 127.0.0.1 11211
```
