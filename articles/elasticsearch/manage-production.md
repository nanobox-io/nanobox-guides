# Managing Production Data
To establish a secure remote connection to your production database, use the Nanobox CLI's [`tunnel` command](https://docs.nanobox.io/cli/tunnel/). This will bind to a local port and forward requests to your live Elasticsearch database through a secure tunnel.

#### Open a Tunnel to Elasticsearch
Use the ID of the Elasticsearch component in your `boxfile.yml` to establish a tunnel (data.elasticsearch, data.es, etc.).

```bash
nanobox tunnel data.elasticsearch
```

The tunnel command will output the port to which it is bound.

**Note:** Because the tunnel is bound to a port on your local machine, `127.0.0.1` is the host to which you connect.

## Use Your Client of Choice to Connect
Use the tunnel-bound port on your local machine and the tunnel credentials provided in your dashboard to connect with your Elasticsearch client or GUI of choice.
