# Importing Uploads

When using WordPress with Nanobox, `wp-content/uploads` should be specified as a `network_dir` under your web component in your boxfile.yml. This allows WordPress to store uploaded files in a persistent, writable, shared filesystem accessible to your web node(s).

The contents of network directories are stored outside your code's read-only filesystem in your app's storage component. To import data into your storage component, you need to connect with SSH or SFTP and upload the files. How this is done depends on which environment you're in.

## In Dev & Sim
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

### Connect with SSH or SFTP
Use the IP of your storage component along with the user and password provided in the info output to connect with to SSH, SFTP, or your GUI of choice.

Other credentials you may need to establish the connection:

**Port:** `22`

#### Copy Files with SCP (Secure Copy)
```bash
# copy the contents of your local uploads folder
# into to your uploads folder in your storage component

scp -r wp-content/uploads/* nanobox@192.168.99.74:wp-content/uploads

# This will prompt for your storage password
```

#### Use SFTP
You can also an FTP client to import your uploads. The  `wp-content/uploads` will already exist in your storage component, so you can simply transfer the files in.

![Local Storage Component SFTP Connection](/assets/storage/storage-sftp-local.png)

## In Production

To establish a secure remote connection to your production storage component, use the Nanobox CLI's [`tunnel` command](https://docs.nanobox.io/cli/tunnel/). This will bind to a local port and establish a secure tunnel to your live component.

#### Open a Tunnel to Your Storage Component
```bash
$ nanobox tunnel data.storage
```

Connection credentials for the tunnel are provided in your app dashboard under the "Connect" section of your storage component.

![Storage Tunnel Connection Credentials](/assets/storage/tunnel-creds.png)

**Note:** Because the tunnel is bound to a port on your local machine, `127.0.0.1` is the host to which you connect.

### Connect with SSH or SFTP
Use the tunnel-bound port on your local machine and the tunnel credentials provided in your dashboard to connect with SSH or SFTP.

#### Copy files with SCP
```bash
# copy files from your local code filesystem
# into to your storage component at the same path

scp -P 22 -r wp-content/uploads/* nanobox@127.0.0.1:wp-content/uploads

# This will prompt for your storage password
```

#### Transfer with SFTP
You can use an FTP client to import your uploads. The  `wp-content/uploads` will already exist in your production storage component, so you can simply transfer the files in.

![Production Storage Component SFTP Connection](/assets/storage/storage-sftp-prod.png)
