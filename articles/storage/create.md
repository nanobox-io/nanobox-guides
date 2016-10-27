# Create a Storage Component

Nanobox storage components provide a shared, writable, persistent filesystem for your app. Contents in storage components persist between deploys and are shared between all web and worker nodes. More information about the reason storage services are necessary is available in the [Network Storage documentation](https://docs.nanobox.io/app-config/network-storage/).

To create a storage component, add a data component to your boxfile.yml with the `image` set to `nanobox/unfs` with version `0.9`.

```yaml
data.storage:
  image: nanobox/unfs:0.9
```

**Note:** *For purposes of these guides, we'll use* `data.storage` *as the component ID.* `storage` *is a unique identifier that can be whatever you'd like. More information about component IDs is available in the [boxfile.yml documentation](https://docs.nanobox.io/boxfile/#component-ids).*


## Deploy Changes
With your storage component included in your boxfile.yml, deploy the changes to your dev, sim, or production environment(s). During the deploy process, your storage component will be created.

```bash
nanobox dev deploy
```
