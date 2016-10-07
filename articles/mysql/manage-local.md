# Managing Local Data
When working in local dev or sim environments, your MongoDB component is given it's own virtual IP and port to which you can connect. To view these credentials, use the Nanobox CLI's `info` command.

```bash
# View app/component info in dev
nanobox dev info

# ...

data.mysql
  IP      : 192.168.99.76
  User(s) :
    root - kLuuZYMVqZ
    nanobox - rC9ETppTfX

# ...
```

## Use Your Client of Choice to Connect
Use the IP of your MongoDB component with either the root or nanobox user/password provided in the info output to connect with your MySQL client or GUI of choice.

Other credentials you may need to establish the connection:

**Port:** `3306`  
**Name:** `gonano`

Here's an example connection with [Sequel Pro](https://www.sequelpro.com/):

![Sequel Pro Local Connection Example](/assets/mysql/sequel-pro-local.png) 
