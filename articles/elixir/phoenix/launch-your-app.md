## Signup

If you haven't already, you'll need to signup with <a href="https://dashboard.nanobox.io" target="\_blank">Nanobox</a>.

## Add a Hosting Provider
Nanobox provisions and deploys your app on your hosting provider. To link a hosting account, go to your account admin under <a href="https://dashboard.nanobox.io/users/provider_accounts" target="\_blank">hosting accounts</a>.

## Launch a New App
New apps are launched from your <a href="https://dashboard.nanobox.io" target="\_blank">app dashboard</a>.

#### Phoenix 1.3 PORT environment variable

In Phoenix v1.3 and up, the `PORT` environment variable must be set when running in production.
Nanobox [forwards all http/s traffic](https://docs.nanobox.io/domains-networking/protocols-incoming-requests/#http-https) on 80 and 443 to the application running on 8080. Before deploying to production, add the environment variable to your `remote` context. Before launching your nanobox app set this variable with:

```bash
nanobox evar add remote PORT=8080
```
