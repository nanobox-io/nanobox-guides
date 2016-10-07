# Managing Local Data
When working in local dev or sim environments, your PostgreSQL component is given it's own virtual IP and port to which you can connect. To view these credentials, use the Nanobox CLI's `info` command.

```bash
# View app/component info in dev
nanobox dev info

# ...

data.postgres
  IP      : 192.168.99.77
  User(s) :
    nanobox - Xz6leSMkFb

# ...
```

## Use Your Client of Choice to Connect
Use the IP of your PostgreSQL component with either the root or nanobox user/password provided in the info output to connect with your PostgreSQL client or GUI of choice.

Other credentials you may need to establish the connection:

**Port:** `5432`  
**Name:** `gonano`
