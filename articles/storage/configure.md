# Storage Config Options

Storage components are configured in your `boxfile.yml`. All available configuration options are outlined below.

### UNFS Version
Storage components are created using the `nanobox/unfs` image. You should append the UNFS version number to your `image` with a `:`. The following version(s) are available:

- 0.9

**Note:** UNFS versions cannot be changed after the service is created. To use a different version, you'll have to create a new atorage component and manually migrate data.

```yaml
data.db:
  image: nanobox/unfs:0.9
```

## Storing Files in a Storage Component
Directories inside your app are connected to your storage component through the [network_dirs](https://docs.nanobox.io/boxfile/web/#network-directories) config in your web and worker boxfile.yml configs. The [Storing Files in a Storage Component guide](/storage/storing-files) walks through setting up network directories.
