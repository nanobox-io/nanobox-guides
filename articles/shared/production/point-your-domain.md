# Point your domain

Using your own domain on your app is really simple and can be done by either adding an A-Record or CNAME to your DNS zone file. The pros and cons of using each method are outlined [Using Custom Domains documentation](https://docs.nanobox.io/domains-networking/using-custom-domains/).

## Using an A-Record
A-Records are used to point your domain to a specific IP address. If you choose to use this method, you need to point your domain to the IP of the server that houses your app's [load-balancer](/production-management/platform-components/#load-balancer). This IP can be found in your dashboard under Network > DNS.

![Load-Balancer IP](/assets/shared/point-your-domain.png)

## Using a CNAME
CNAMEs are used to define aliases for domains. Essentially they point a domain at another domain, but are not a redirect. For example, if domain.com has a CNAME for myapp.nanoapp.io, domain.com acts as a alias for myapp.nanoapp.io and loads the site without changing the request URI.

Every app deployed with Nanobox is given a dev url using this pattern: `app-name.nanoapp.io`. You can CNAME your own domain to your app's nanoapp.io domain.
