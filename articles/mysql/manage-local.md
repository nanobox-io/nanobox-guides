# Managing Local Data
When working in your local Nanobox environment, your MySQL component is given it's own virtual IP and port to which you can connect. To view these credentials, use the Nanobox CLI's `info` command.

```bash
# View local app/component info
nanobox info local

# ...

data.mysql
  IP      : 192.168.99.76
  User(s) :
    root - kLuuZYMVqZ
    nanobox - rC9ETppTfX

# ...
```

## Use Your Client of Choice to Connect
Use the IP of your MySQL component with either the root or nanobox user/password provided in the info output to connect with your MySQL client or GUI of choice.

Other credentials you may need to establish the connection:

**Port:** `3306`  
**Name:** `gonano`

Here's an example connection with [Sequel Pro](https://www.sequelpro.com/):

![Sequel Pro Local Connection Example](/assets/mysql/sequel-pro-local.png)
