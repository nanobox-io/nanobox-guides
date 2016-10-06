# GeoIP Settings

The following settings are used to configure the GeoIP PHP extension.

### geoip\_custom\_directory
Sets the [`geoip.custom_directory` PHP setting](http://php.net/manual/en/geoip.configuration.php). When specifying the path to the directory, it should be relative to the root of your repo.

**Note:** When using the `geoip` php extension, you need to provide your own GeoIP database. Free databases are [available for download from Maxmind](http://dev.maxmind.com/geoip/legacy/geolite/#Downloads). Maxmind also provides subscription databases that tend to be more accurate.

```yaml
code.build:
  config:
    geoip_custom_directory: 'app/GeoIP/'
```
