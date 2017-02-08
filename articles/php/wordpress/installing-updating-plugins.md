# Installing & Updating Plugins

WordPress plugins are a major reason WordPress is so widely used. They provide a really simple way to quickly and easily extend WordPress to fit your specific needs.

Installing and updating plugins requires modifying the filesystem, which is why it's typically done through FTP. However this poses a problem since the filesystem is read-only for apps deployed with Nanobox. Nanobox allows you to launch a local development environment that gives you full write access to your filesystem where you can install and update plugins.

## Start Your WordPress App
The quickest way to start your app to run:

```bash
nanobox run php-server
```

This will start your local dev environment and run WordPress.

## Install & Update Plugins Like You Would Normally
When using WordPress locally, you can manage plugins the same way you normally would. You can either manually download plugins and include them in your `wp-content/plugins` directory or you can install/upgrade plugins through your WordPress admin panel in your dev app.

![Install Plugins](/assets/php/wordpress/wp-plugins.png)

## Don't Store Plugins in a Network Directory
Network directories are stored in your persistent network file-storage and are shared between all web nodes. It can be tempting to specify `wp-content/plugins` or `wp-content` as a `network_dirs` in your boxfile.yml, but this is a bad idea. Here's why:

### Slow Performance
Requests to network directories must traverse your app's network, adding latency to every request. While this latency is minimal, it can add up very quickly.

### Bytecode Caching
If you're using a bytecode cache like xCache or OPcache, PHP will cache its first response it gets back from a file in your filesystem. If that file gets updated, PHP will never see it since a response is already cached.

If you're running in a multi-node web component, things can get even more complicated. Each node will store its own bytecode cache, potentially resulting in out-of-sync nodes serving inconsistent results.
