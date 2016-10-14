# Storing Files in a Storage Component

Directories inside your storage component are connected to your app through [network mounts](https://docs.nanobox.io/app-config/network-storage/#network-mounts). These mounts essentially replace directories in your web and worker filesystems allowing you to use the same filepaths in your code to store the files in your storage component.

## Network Directories
For each web and worker component in your boxfile.yml, you need to tell Nanobox which directories to mount and the storage service to which they should be connected. These are called "network directories" and are specified through the `network_dirs` config.

```yaml
web.site:
  network_dirs:
    data.storage:
      - path/to/dirA
      - path/to/dirB

data.storage:
  image: nanobox/unfs
```

Anything written by web.site to `path/to/dirA` and `path/to/dirB` will be stored in your storage component.

**Note:** *Network directories paths must be relative to the root of your project.*

### Sharing Network Dirs Between Components
Network directories must be specified per web/worker component. If two components need to write to the same file, the `network_dirs` config needs to be specified on both.

```yaml
web.site:
  network_dirs:
    data.storage:
      - path/to/dirA
      - path/to/dirB

worker.jobs:
  network_dirs:
    data.storage:
      - path/to/dirA

data.storage:
  image: nanobox/unfs
```

Both web.site and worker.jobs will be able to write to and read from `path/to/dirA` on data.storage.

## Importing Things to Note
The following are importing things you should know when using storage components.

### Do Not Nest Network Dirs in other Network Dirs
When listing network directories, do not list nested directories. Only list the common most parent. For example, you shouldn't include both `tmp-files` and `tmp-files/logs` as network directories. You should only include `tmp-files`

Listing nested network directories will invalidate the network mounts and prevent a successful connection to your storage component.

### Local Directories are Replaced by Network Mounts
Because network directories are replaced with network mounts, the contents of network directories in your local filesystem will not be available. Also, anything written to a network directory will be written to the filesystem of your storage component, not your local filesystem.

You can import and export data to and from your storage components using SSH and/or SFTP. Examples of this are covered in the [Managing Local Storage Components](/storage/manage/local) and [Managing Production Storage Components](/storage/manage/production) guides.

### Add Network Directories to Your .nanoignore
The [.nanoignore](https://docs.nanobox.io/local-dev/local-config/nanoignore/) file allows you to omit files from your [compiled deploy package](https://docs.nanobox.io/cli/compile/), reducing the size of your deploy and time it takes to upload. Since network directories are replaced by network mounts, it's recommend the contents of these directories be .nanoingore'd.
