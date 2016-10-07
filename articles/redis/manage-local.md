# Managing Local Data
When working in local dev or sim environments, your Redis component is given it's own virtual IP and port to which you can connect. To view these credentials, use the Nanobox CLI's `info` command.

```bash
# View app/component info in dev
nanobox dev info

# ...

data.redis
  IP      : 192.168.99.78

# ...
```

## Use Your Client of Choice to Connect
Use the IP of your Redis component with either the root or nanobox user/password provided in the info output to connect with your Redis client or GUI of choice.

Other credentials you may need to establish the connection:

**Port:** `6379`

### Redis CLI Connection Example
```bash
redis-cli -h 192.168.99.78 -p 6379
```
