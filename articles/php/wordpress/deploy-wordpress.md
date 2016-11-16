# Deploy WordPress

## Test Locally First
Nanobox provides a "sim" environment that simulates a full production deploy on your local machine. Once you're done making changes in dev and are ready to test your app, test the deploy and running app in sim:

```bash
# Compile your code
nanobox compile

# Start your sim environment
nanobox sim start

# Add a convenient way to access your sim app from the browser:
nanobox sim dns add wordpress.nanobox.sim

# Deploy to your sim environment
nanobox sim deploy
```

Once deployed, you can access and test your sim app at `http://wordpress.nanobox.sim`.

*Dev and sim environments are completely isolated from each other so you may want/need to [import data](/php/wordpress/importing-data) and [uploads](/php/wordpress/importing-uploads) into your sim app.*


## Launch Your App with Nanobox
Login to your [Nanobox dashboard](https://dashboard.nanobox.io) and [launch a new app](https://docs.nanobox.io/production/launch-app/).

### Link Your Codebase to Your New App
In order to deploy to your new app, you'll need to link it to your local WordPress codebase using the `nanobox link` command.

```bash
# Link your local codebase to your nanobox app
nanobox link app-name
```

### Set Auth Key & Salt Evars
WordPress uses authentication keys and salts to securely create sessions. If you've updated your wp-config.php to use the configuration specified [here](/php/wordpress//#setup-auth-keys-salts), you'll need to set those environment variables in your production app.

Visit [WordPress' Auth Key and Salt API](https://api.wordpress.org/secret-key/1.1/salt/) to generate random values for each. Pass each key-value pair into your Nanobox app using the following command:

<em style="font-size: .8em">This is an example. Be sure to use your own unique values.</em>

```bash
nanobox evar add AUTH_KEY='Sl>,5![EPRR:7dQd4/P03$_5Ira$dF,~>' SECURE_AUTH_KEY=':=D;!X(1an~r#B(L.E?_+oAYXoGgjDen1' LOGGED_IN_KEY='4]X]-,`1zjrcvG=WSWE/-2+n%=V^bHB9J' NONCE_KEY='WJVs@}9#s7U,q-}<>07FvxHO3rYJ`u-{p' AUTH_SALT='S$.W{XrI2%adaMysm-<S:e&d!<9E-)N/d' SECURE_AUTH_SALT='_h)+V.XBHXL@@Cc.BG,-At|vS|)_rOJ`H' LOGGED_IN_SALT=';VE`XM9--ih!LJju=c;2|/|6$8ik0u[Me' NONCE_SALT='/fTF;u`(z<$|d nse?HwD1Ih@o[:v=ub|'
```

### Deploy to Your App
```bash
# deploy to your nanobox app
nanobox deploy
```

Your app's build package will be deployed to your app on Nanobox and all your app's components (web, database, storage) will be provisioned.

### Import Data & Uploads
With your production app up and running, you can import your database and uploads if necessary.

[Importing Data](/php/wordpress/importing-data/#importing-data-into-a-production-database)  
[Importing Uploads](/wordpress/importing-uploads/)

*If importing data, be sure to [update your baseurl in your database](/php/wordpress/importing-data/#update-your-wordpress-baseurl).*

## Enjoy Your Live WordPress App
Congratulations. Your WordPress app is now live. The here's a few next steps you may want to go through:

[Point Your Domain](/php/wordpress/point-your-domain)  
[SSL/TLS Encryption](/php/wordpress/encryption)  
[Force HTTPS](/php/wordpress/force-https)
