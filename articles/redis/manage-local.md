# Managing Local Data
When working in your local Nanobox environment, your Redis component is given it's own virtual IP and port to which you can connect. To view these credentials, use the Nanobox CLI's `info` command.

```bash
# View local app/component info
nanobox info local

# ...

data.redis
  IP      : 192.168.99.78

# ...
```

## Use Your Client of Choice to Connect
Use the IP of your Redis component provided in the info output to connect with your Redis client or GUI of choice.

Other credentials you may need to establish the connection:

**Port:** `6379`

### Redis CLI Connection Example
```bash
redis-cli -h 192.168.99.78 -p 6379
```
