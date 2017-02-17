# Force HTTPS in WordPress

Your WordPress app running on Nanobox sits behind a load balancer that forwards requests to your web server. Because of this, you must use the `X-Forwarded-Proto` HTTP header to detect the requests origin protocol and redirect appropriately. All redirects are handled in your `.htaccess`. Below is an example of what the redirect using the `X-Forwarded-Proto` header would look like.

#### Forcing HTTPS in the .htaccess
```apacheconf
RewriteEngine On
RewriteCond %{HTTP:X-Forwarded-Proto} !https [NC]
RewriteRule ^(.*)https://%{HTTP_HOST}%{REQUEST_URI} [L,R=301]
```

## Forcing HTTPS Only on Live Servers
When running WordPress locally in development or in a dry-run environment, forcing HTTPS will result in an error since there is no certificate on your local DNS. To get around this, you can use a "config swap" to switch out your .htaccess when deploying to a live app.

### Create Two .htaccess files
For the config swap to happen, you need to have two versions of your `.htaccess` file - one with the HTTPS rewrite and one without. Create a `nanobox` subdirectory in the root of your project, add add the `live.htaccess` with the HTTPS rewrite there. Leave the `.htaccess` in the root of your project as is.

#### nanobox/live.htaccess
```apacheconf
# BEGIN WordPress
<IfModule mod_rewrite.c>
RewriteEngine On
RewriteBase /
RewriteRule ^index\.php$ - [L]
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule . /index.php [L]

# Force https
RewriteCond %{HTTP:X-Forwarded-Proto} !https [NC]
RewriteRule ^(.*)https://%{HTTP_HOST}%{REQUEST_URI} [L,R=301]
</IfModule>
# END WordPress
```

#### .htaccess
```apacheconf
# BEGIN WordPress
<IfModule mod_rewrite.c>
RewriteEngine On
RewriteBase /
RewriteRule ^index\.php$ - [L]
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule . /index.php [L]
</IfModule>
# END WordPress
```

**Note:** With two .htaccess files, any modifications made by plugins or directly will need to be manually applied to `nanobox/live.htaccess`.

## Swap the .htaccess Files on Deploy
`transform` hooks in your `boxfile.yml` allow you to modify your codebase during the deploy process. Using the `APP_NAME` environment variable that gets created with every app, you can initiate a file swap:

```yaml
deploy.config:
  transform:
    - 'if [ $APP_NAME == "yourappname" ]; then mv /app/nanobox/live.htaccess /app/.htaccess; fi'
```

*Be sure to replace* `yourappname` *with your app's actual name.*

With this in place, HTTPS will only be enforced in your live app.
