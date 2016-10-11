# Managing Local Storage Components

When working in local dev or sim environments, your storage component is given it's own virtual IP and port to which you can connect. To view these credentials, use the Nanobox CLI's info command.

```bash
# View app/component info in dev
nanobox dev info

# ...

data.storage
  IP      : 192.168.99.74
  User(s) :
    gonano - OpAssWoRDX

# ...
```

## Connect with SSH or SFTP
Use the IP of your storage component along with the user and password provided in the info output to connect with to SSH, SFTP, or your GUI of choice.

Other credentials you may need to establish the connection:

**Port:** `22`

Network directories are housed in the `data` directory in the home directory of your storage component. Directory paths are relative to the `data` directory.

### SSH Example
```bash
ssh gonano@192.168.99.74
# You'll be prompted for the password

# navigate to a network directory
cd data/path/to/dirA
```

### SCP Examples
```bash
# copy files from your local code filesystem
# into to your storage component at the same path
scp -r path/to/dirA/* gonano@192.168.99.74:data/path/to/dirA

# copy files from your storage component
# into to your local code filesystem
scp -r gonano@192.168.99.74:data/path/to/dirA/* path/to/dirA

# Both commands will prompt for the password
```

### SFTP Example
![Local Storage Component SFTP Connection](/assets/storage/storage-sftp-local.png)
