# Managing Production Data
To establish a secure remote connection to your production component, use the Nanobox CLI's [`tunnel` command](https://docs.nanobox.io/cli/tunnel/). This will bind to a local port and establish a secure tunnel to your live Redis component.

#### Open a Tunnel to Redis
```bash
$ nanobox tunnel data.redis
```

The tunnel command will output the port to which it is bound. Connection credentials for the tunnel are provided in your app dashboard under the "Connect" section of your Redis component.

![Redis Tunnel Connection Credentials](/assets/redis/tunnel-creds.png)

**Note:** Because the tunnel is bound to a port on your local machine, `127.0.0.1` is the host to which you connect.

## Use Your Client of Choice to Connect
Use the tunnel-bound port on your local machine to connect with your Redis client or GUI of choice. Credentials needed to establish the connection:

**Host:** `127.0.0.1`  
**Port:** *Shown in tunnel output*

### Redis CLI Connection Example
```bash
redis-cli -h 127.0.0.1 -p 6379
```
