# Reduce the Size of Your Deploy

Each time you [compile your code](https://docs.nanobox.io/cli/compile/), Nanobox copies everything in your WordPress directory into the deploy package. However, not everything needs to be included. Some things add unnecessary bloat resulting in large deploy packages and slow uploads.

### .nanoignore
Nanobox allows you to omit specific files and directories from your deploy through the `.nanoignore` file. This should be included in the root of your WordPress directory.

Below is the recommended `.nanoignore` for WordPress apps:

```conf
wp-content/uploads/
.git/
.gitignore
.hg/
.hgignore
.svn/
```

#### wp-content/uploads/
Because `wp-content/uploads` is a [network directory](/php/wordpress/advanced/boxfile-explained/#network_dirs)

#### Version Control Files
Version control histories aren't necessary in deploy packages and can substantially increase the size of your deploy. Feel free to only include the files applicable to the version control software you're using.

For more information about .nanoignore files, view the [.nanoignore documentation](https://docs.nanobox.io/local-dev/local-config/nanoignore/).
