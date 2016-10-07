# Managing Local Storage Components

When working in local dev or sim environments, your storage component is given it's own virtual IP and port to which you can connect. To view these credentials, use the Nanobox CLI's info command.

```bash
# View app/component info in dev
nanobox dev info

# ...

data.storage
  IP      : 192.168.99.74
  User(s) :
    nanobox - OpAssWoRDX

# ...
```

## Connect with SSH or SFTP
Use the IP of your storage component along with the user and password provided in the info output to connect with to SSH, SFTP, or your GUI of choice.

Other credentials you may need to establish the connection:

**Port:** `22`

### SSH Example
```bash
ssh nanobox@192.168.99.74
# You'll be prompted for the password
```

### SCP Examples
```bash
# copy files from your local code filesystem
# into to your storage component at the same path
scp -r path/to/dirA/* nanobox@192.168.99.74:path/to/dirA

# copy files from your storage component
# into to your local code filesystem
scp -r nanobox@192.168.99.74:path/to/dirA/* path/to/dirA

# Both commands will prompt for the password
```

### SFTP Example
![Local Storage Component SFTP Connection](/assets/storage/storage-sftp-local.png)
