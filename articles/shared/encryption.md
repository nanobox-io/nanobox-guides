# SSL/TLS Encryption

Normally the process of adding SSL/TLS encryption to your app is tedious and complicated. With Nanobox, we've tried to make it as simple as possible.

## Add a New Certificate
To get started, click on the "Network" tab of your application dashboard and go to "SSL/TLS Certificates". Then click "New SSL/TLS Certificate".

![New SSL/TLS Certificate](/assets/shared/ssl-tls-add.png)

In order to generate a certificate, specific information is required. Provide the necessary information and click "Create Certificate".

![Certificate Information](/assets/shared/ssl-tls-required-info.png)

## Create a Bundle
With the information provided, you can now create a certificate "bundle". A bundle consists of a Private Key, a Certificate, and a Certificate Authority (CA) - all the files required to install a certificate on a server.

To create a new bundle, click "New Bundle".

![Create New Bundle](/assets/shared/ssl-tls-new-bundle.png)

There are different bundle types to choose from when creating a new bundle. Descriptions of each and details instructions are provided for each in the [Adding SSL/TLS documentation](https://docs.nanobox.io/domains-networking/ssl-tls/adding/).

- [LetsEncrypt](https://docs.nanobox.io/domains-networking/ssl-tls/adding/#letsencrypt)  
- [Self-Signed](https://docs.nanobox.io/domains-networking/ssl-tls/adding/#self-signed)  
- [Third-Party New](https://docs.nanobox.io/domains-networking/ssl-tls/adding/#third-party-new)  
- [Third-Party Import](https://docs.nanobox.io/domains-networking/ssl-tls/adding/#third-party-import)

## Activate the Bundle
Once your bundle is complete, click the "Activate" button next to your bundle. The bundle will be installed in your app's router and your app will be able to accept HTTPS connections.

![Activate Bundle](/assets/shared/ssl-tls-bundle-activate.png)

## Detecting Request Protocols
Your app's load balancer appends the `X-Forwarded-Proto` header to all incoming requests. This is the HTTP header that should be to detect the protocols of incoming requests in webserver redirect/rewrite logic.
