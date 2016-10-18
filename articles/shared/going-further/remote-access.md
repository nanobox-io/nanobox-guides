# Remote Access

Nanobox provides different methods for remotely accessing production apps deployed with Nanobox:

- [Nanobox Console](#nanobox-console)
- [Nanobox Tunnel](#nanbox-tunnel)

## Nanobox Console
The `nanobox console` command will drop you into an interactive console inside a component running on your production platform. Here you can navigate around your component filesystem and use any executables included in your app's runtime.

```bash
# Pattern
nanobox console <component.id>

# Example
nanobox console web.main
```

More information is available in the [`console` documentation](https://docs.nanobox.io/cli/console/)

## Nanobox Tunnel
The `nanobox tunnel` command creates a secure tunnel from your local machine to a production data component. It binds to a local port and forwards requests to that port through the secure tunnel to your production component.

```bash
# Pattern
nanobox tunnel <component.id> -p <local_port>

# Example
nanobox tunnel data.db -p 5432
```

With the tunnel open, you can use your local client of choice to connect to and manage data components. Tunnel connection credentials are provided in your app dashboard under the "Connect" tab of the component.

![Tunnel Credentials](/assets/shared/remote-access-tunnel-creds.png)

More information is available in the [`tunnel` documentation](https://docs.nanobox.io/cli/tunnel/)
