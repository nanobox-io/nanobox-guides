# Managing Local Data
When working in local dev or sim environments, your MongoDB component is given it's own virtual IP and port to which you can connect. To view these credentials, use the Nanobox CLI's `info` command.

```bash
# View app/component info in dev
nanobox dev info

# ...

data.mongodb
  IP      : 192.168.99.79

# ...
```

## Use Your Client of Choice to Connect
Use the IP of your MongoDB component provided in the info output to connect with your Mongo client or GUI of choice.

Other credentials you may need to establish the connection:

**Port:** `27017`  
**Name:** `gonano`  
