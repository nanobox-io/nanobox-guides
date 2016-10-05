---
title: Reduce the Size of Your WordPress Build
project: wordpress
---

Each time you generate a build, Nanobox copies everything in your WordPress directory into the build package. However, not everything needs to be included in your build. In fact, many things and can add unnecessary bloat resulting in large builds and slow uploads.

## .nanoignore
Nanobox allows you to omit specific files and directories from your build package by using a `.nanoignore` file. This should be included in the root of your WordPress directory.

Below is the recommended `.nanoignore` for WordPress apps:

```conf
wp-content/uploads/
.git/
.gitignore
.hg/
.hgignore
.svn/
```

For more information about .nanoignore files, view the [.nanoignore documentation](https://docs.nanobox.io/local-dev/nanoignore/).

**Note:** Version control histories aren't necessary in builds and can substantially increase the size of your build package. Feel free to only include the files applicable to the version control software you're using.
