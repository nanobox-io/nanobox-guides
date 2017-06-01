# Managing Local Data

_**Work in Progress**_

When working in your local Nanobox environment, your PostgreSQL component is given it's own virtual IP and port to which you can connect. To view these credentials, use the Nanobox CLI's `info` command.

```bash
# View local app/component
nanobox info local

# ...

data.rethinkdb
  IP      : 192.168.99.77
# ...
```

## Use Your Client of Choice to Connect
Use the IP of your PostgreSQL component with either the root or nanobox user/password provided in the info output to connect with your PostgreSQL client or GUI of choice.

Other credentials you may need to establish the connection:

**Port:** `5432`  
**Name:** `gonano`
