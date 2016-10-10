# Force HTTPS in WordPress

Your WordPress app running on Nanobox sits behind a load balancer that forwards requests to your web server. Because of this, you must use the `X-Forwarded-Proto` HTTP header to detect the requests origin protocol and redirect appropriately. All redirects are handled in your `.htaccess`. Below is an example of what the redirect using the `X-Forwarded-Proto` header would look like.

#### Forcing HTTPS in the .htaccess
```apacheconf
RewriteEngine On
RewriteCond %{HTTP:X-Forwarded-Proto} =http
RewriteRule ^(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [L,R=301]
```
