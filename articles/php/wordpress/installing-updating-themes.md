# Installing & Updating Themes

WordPress themes provide a great way way to quickly and easily customize your WordPress install and make it unique to you and/or your company.

Installing and updating themes requires modifying the filesystem, which is why it's typically done through FTP. However this poses a problem since the filesystem is read-only in production and sim apps on Nanobox. Luckily, Nanobox allows you to launch a local dev environment that gives you full write access to your filesystem where you can install and update themes.

### Start Your Local WordPress
The quickest way to start your app locall is to run:

```bash
nanobox run php-server
```

This will start your dev environment if it's not running, then run the [start commands specified in your boxfile.yml](/wordpress/boxfile-explained/#start).

## Install & Update Themes Like You Would Normally
When using WordPress in dev, you can manage themes the same way you normally would. You can either manually download themes and include them in your `wp-content/themes` directory or you can install themes through your WordPress admin panel in your dev app. Theme files can be updated in your local filesystem and changes will be reflected in your running dev app.

![Install Themes](/assets/php/wordpress/wp-themes.png)

## Don't Store Themes in a Network Directory
Network directories are stored in your persistent network file-storage and are shared between all web nodes. It can be tempting to specify `wp-content/themes` or `wp-conent` as a `network_dirs` in your boxfile.yml, but this is a bad idea. Here's why:

### Slow Performance
Requests to network directories must traverse your app's network, adding latency to every request. While this latency is minimal, it can add up very quickly, especially since theme files are accessed on every page load.
