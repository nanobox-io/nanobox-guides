# Install Nanobox

## Download
If you haven't already, download Nanobox from the [Nanobox Download](https://nanobox.io/download/) page.

## Install
Installers are available for Mac OSX and Windows. Installation instructions are provided for Linux but are also available in the [Install Nanobox doc](https://docs.nanobox.io//install-nanobox/).

## Enable netfs
When working locally, your local codebase is mounted into your Nanobox container. The default mounting solution is slow and we *highly recommend* switching to `netfs` for drastic performance improvements.

In your user home directory, there's a `.nanobox/config.yml`. This file is used to configure your Nanobox container and how the container interacts with your local filesystem.

Set the `mount-type` to `netfs` for faster reads and writes in your local development environments.

```yaml
mount-type: netfs
```

More information is available in the [Local Performance Tuning documentation](https://docs.nanobox.io/local-dev/local-config/local-performance/).
