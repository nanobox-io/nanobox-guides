# Managing Local Data
When working in your local Nanobox environment, your Elasticsearch component is given its own virtual IP and port to which you can connect. To view these credentials, use the Nanobox CLI's `info` command.

```bash
# View local app/component info
nanobox info local

# ...

data.elasticsearch
  IP      : 172.21.0.24

# ...
```

## Use Your Client of Choice to Connect
Use the IP of your Elasticsearch component provided in the info output to connect with your Elasticsearch client or GUI of choice.

Other credentials you may need to establish the connection:

**Port:** `9200` 
