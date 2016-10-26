# Manage Platform

Every app deployed with Nanobox includes "platform components", components provisioned by Nanobox to provide key functionality for your app running in production.

![Platform Components](/assets/shared/platform-components.png)

**Load Balancer**  
Router and load-balancer. The public access point for your app.

**Monitor**  
Tracks and stores resource usage (RAM, CPU, Disk, etc.) of components and nodes.

**Logger**  
Captures and stores logs from your app's components.

**Message Bus**  
Pushes data to the Nanobox dashboard/API for live updates.

**Warehouse**  
Storage component that houses files and data required for apps, such as code builds and data backups.

## Scaling Platform Components
Platform components can be scaled and managed just like app components. Management options can be accessed by clicking the "Manage" button under the platform component.

In order to scale a platform component, it must be [moved out of the bunkhouse server](https://docs.nanobox.io/scaling/moving-components/). Once moved, you will be able to scale the platform component under the "Scale" tab.
