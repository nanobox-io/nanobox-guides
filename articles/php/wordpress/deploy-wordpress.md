# Deploy WordPress

## Test Locally First
Nanobox provides a "dry-run" environment that simulates a full production deploy on your local machine. Once you're done making changes in dev and are ready to test your app, test the deploy and running app in dry-run:

```bash
# Add a convenient way to access your dry-run app from the browser:
nanobox dns add dry-run wordpress.test

# Deploy to dry-run
nanobox deploy dry-run
```

Once deployed, you can access and test your test app at `http://wordpress.test`.

*Development and dry-run environments are completely isolated from each other so you may want/need to [import data](/php/wordpress/importing-data) and [uploads](/php/wordpress/importing-uploads) into your dry-run app.*


## Launch Your App with Nanobox
Login to your [Nanobox dashboard](https://dashboard.nanobox.io) and [launch a new app](https://docs.nanobox.io/workflow/launch-app/).

### Add Your App as a Remote
In order to deploy to your new app, you'll need to add the app as a remote on your local project using the `nanobox remote add` command.

```bash
# Link your local codebase to your nanobox app
nanobox remote add app-name
```

### Set Auth Key & Salt Evars
WordPress uses authentication keys and salts to securely create sessions. If you've updated your wp-config.php to use the configuration specified [here](/php/wordpress//#setup-auth-keys-salts), you'll need to set those environment variables in your production app.

Visit [WordPress' Auth Key and Salt API](https://api.wordpress.org/secret-key/1.1/salt/) to generate random values for each. Save the content of this page in a file named `evars`. Use the Nanobox CLI to load the environment variables from the `evars` file.

#### ./evars
<em style="font-size: .8em">This is an example. Be sure to use your own unique values.</em>

```bash
AUTH_KEY="Sl>,5![EPRR:7dQd4/P03$_5Ira$dF,~>"
SECURE_AUTH_KEY=":=D;!X(1an~r#B(L.E?_+oAYXoGgjDen1"
LOGGED_IN_KEY="4]X]-,'1zjrcvG=WSWE/-2+n%=V^bHB9J"
NONCE_KEY="WJVs@}9#s7U,q-}<>07FvxHO3rYJ'u-{p"
AUTH_SALT="S$.W{XrI2%adaMysm-<S:e&d!<9E-)N/d"
SECURE_AUTH_SALT="_h)+V.XBHXL@@Cc.BG,-At|vS|)_rOJ'H"
LOGGED_IN_SALT=";VE'XM9--ih!LJju=c;2|/|6$8ik0u[Me"
NONCE_SALT="/fTF;u'(z<$|d nse?HwD1Ih@o[:v=ub|"
```

_**Note:** There are some character and formatting restrictions you should be aware of that are covered in the [`evar` command documentation](https://docs.nanobox.io/cli/evar/#environment-variable-files). Generally, if you wrap all your values in double quotes (_`""`_), you should be ok._

#### Add the Environment Variables
````
nanobox evar load ./evars
```

### Deploy to Your App
```bash
# deploy to your nanobox app
nanobox deploy
```

Nanobox will deploye to your app to a live server and provision and all your app's components (web, database, storage).

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
