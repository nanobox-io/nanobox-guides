# Managing Production Data
To establish a secure remote connection to your production database, use the Nanobox CLI's [`tunnel` command](https://docs.nanobox.io/cli/tunnel/). This will bind to a local port and establish a secure tunnel to your live MySQL component.

#### Open a Tunnel to MySQL
```bash
$ nanobox tunnel data.mysql
```

The tunnel command will output the port to which it is bound. Since it's a local port, you'll need to use `127.0.0.1` as your host.

## Use Your Client of Choice to Connect
Use tunnel-bound port on your local machine to connect with your MySQL client or GUI of choice. Credentials needed to establish the connection:

**Host:** `127.0.0.1`  
**Port:** *Shown in tunnel output*  
**Name:** `gonano`  

Here's an example connection with [Sequel Pro](https://www.sequelpro.com/):

![Sequel Pro Production Connection Example](/assets/mysql/sequel-pro-prod.png)
