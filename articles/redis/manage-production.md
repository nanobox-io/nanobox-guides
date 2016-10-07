# Managing Production Data
To establish a secure remote connection to your production component, use the Nanobox CLI's [`tunnel` command](https://docs.nanobox.io/cli/tunnel/). This will bind to a local port and establish a secure tunnel to your live Redis component.

#### Open a Tunnel to Redis
```bash
$ nanobox tunnel data.redis
```

The tunnel command will output the port to which it is bound. Since it's a local port, you'll need to use `127.0.0.1` as your host.

## Use Your Client of Choice to Connect
Use the tunnel-bound port on your local machine to connect with your Redis client or GUI of choice. Credentials needed to establish the connection:

**Host:** `127.0.0.1`  
**Port:** *Shown in tunnel output*

### Redis CLI Connection Example
```bash
redis-cli -h 127.0.0.1 -p 6379
```
