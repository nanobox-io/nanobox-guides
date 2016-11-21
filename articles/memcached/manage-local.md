# Managing Local Data
When working in your local Nanobox environment, your Memcached component is given it's own virtual IP and port to which you can connect. To view these credentials, use the Nanobox CLI's `info` command.

```bash
# View local app/component info
nanobox info local

# ...

data.memcached
  IP      : 192.168.99.75

# ...
```

## Use telnet to Connect
Use `telnet` and the IP of your Memcached component in the info output to connect. You can then use the [telnet commands](https://github.com/memcached/memcached/wiki/Commands) to manage your data.

```bash
# Connect to memcached with telnet
telnet 192.168.99.75 11211
```
