# Managing Production Data
To establish a secure remote connection to your production database, use the Nanobox CLI's [`tunnel` command](https://docs.nanobox.io/cli/tunnel/). This will bind to a local port and establish a secure tunnel to your live MongoDB component.

#### Open a Tunnel to MongoDB
```bash
$ nanobox tunnel data.mongodb
```

The tunnel command will output the port to which it is bound. Since it's a local port, you'll need to use `127.0.0.1` as your host.

## Use Your Client of Choice to Connect
Use tunnel-bound port on your local machine to connect with your Mongo client or GUI of choice. Credentials needed to establish the connection:

**Host:** `127.0.0.1`  
**Port:** *Shown in tunnel output*  
**Name:** `gonano`  
