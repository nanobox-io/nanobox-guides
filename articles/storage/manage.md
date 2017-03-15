# Managing Production Storage Components

To establish a secure remote connection to your production storage component, use the Nanobox CLI's [`tunnel` command](https://docs.nanobox.io/cli/tunnel/). This will bind to a local port and establish a secure tunnel to your live component. You should pass a custom port since port 22 is likely already in use and is reserved for admin users.

#### Open a Tunnel to Your Storage Component
```bash
nanobox tunnel data.storage -p 1234
```

Connection credentials for the tunnel are provided in your app dashboard under the "Connect" section of your storage component.

![Storage Tunnel Connection Credentials](/assets/storage/tunnel-creds.png)

**Note:** Because the tunnel is bound to a port on your local machine, `127.0.0.1` is the host to which you connect.

## Connect with SSH or SFTP
Use the tunnel-bound port on your local machine and the tunnel credentials provided in your dashboard to connect with SSH or SFTP.

Network directories are housed in the `/data/var/db/unfs/` directory of your storage component. Directory paths are relative to `/data/var/db/unfs/`.

### SSH Example
```bash
ssh -p 1234 gonano@127.0.0.1
# You'll be prompted for the password

# navigate to a network directory
cd /data/var/db/unfs/path/to/dirA
```

### SCP Examples
```bash
# copy files from your local code filesystem
# into to your storage component at the same path
scp -P 1234 -r path/to/dirA/* gonano@127.0.0.1:/data/var/db/unfs/path/to/dirA

# copy files from your storage component
# into to your local code filesystem
scp -P 1234 -r gonano@127.0.0.1:/data/var/db/unfs/path/to/dirA/* path/to/dirA

# Both commands will prompt for the password
```

### SFTP Example
![Production Storage Component SFTP Connection](/assets/storage/storage-sftp-prod.png)
