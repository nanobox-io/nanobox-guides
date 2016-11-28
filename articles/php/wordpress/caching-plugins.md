# Using Caching Plugins

Most WordPress caching plugins store cached files in WordPress' local filesystem. Code in live Nanobox apps is read-only, so these caching plugins will not work. However you do have the option to use [writable directories](https://docs.nanobox.io/app-config/writable-dirs/), which can be specified in your boxfile.yml. These are different than [Network Directories](https://docs.nanobox.io/app-config/network-storage/) and are recommended for caching use cases.

## Specify Your Cache Directory as a Writable Directory
Each caching plugin will store cached files in a different location, so you'll need to check your plugin documentation to see exactly which directory needs to be writable. Below is an example for [WP Super Cache](https://wordpress.org/plugins/wp-super-cache/).

```yaml
web.wp:
  writable_dirs:
    - wp-content/plugins/wp-super-cache/
```

## Things to know
### Writable Directories Do Not Persist
Writable directories do not persist between deploys. Each time you deploy your app, your web nodes are replaced with all new, updated nodes. Since writable directories are part of the node filesystem, they are decommissioned with the old node and their contents flushed.

Because of this, your cache is going to have to rebuild itself after each deploy, which in some cases, can add significant overhead to your web component.
