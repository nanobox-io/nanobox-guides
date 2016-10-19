# Scale Your App

Needing to scale your app is usually a good sign, but the process of scaling can be intimidating and time consuming. However Nanobox provides scaling tools in your app dashboard the simplify the process into a few buttons and sliders.

## Scaling Methods
There are two methods of scale available to apps deployed with Nanobox: vertical and horizontal. Each can be used exclusively or together with the other.

### Vertical Scaling
**TLDR:** Adjusting available system resources (RAM, CPU, etc.).

Scaling vertically consists of adding more RAM, CPU, and Disk to your node(s), providing more power or capacity to accomplish their specific tasks.

### Horizontal Scaling
**TLDR:** Adjusting the number of nodes.

Horizontal scaling involves increasing or decreasing the number of nodes inside a component cluster.

## How to Scale
Scaling controls are exposed by clicking the "Scale" button underneath a scalable server/component.

![Scale Button](/assets/shared/scale-button.png)

To scale components individually, they must first be [moved out of a bunkhouse](https://docs.nanobox.io/scaling/moving-components/) into their own scalable cluster.

### The Resource Controller
The resource controller allows you to [scale vertically](#vertical-scaling) by specifying what resources are available to your server/nodes.

![Scaling Server Resources](/assets/shared/scale-resource-controller.png)

### The Node Controller
The Node controller allows you to [scale horizontally](#horizontal-scaling) by specifying the number of nodes in a cluster. It comes in two forms depending on the type of component. Web and worker can scale to an infinite number of nodes. In these components, horizontal scaling is controlled through a slider.

![Scaling the Number of Nodes in a Cluster](/assets/shared/scale-node-slider.png)

## When to Scale
Knowing when and how to scale can be tricky, but your app's health stats and logs will be the best indicators. For a full rundown of knowing when to scale, view the [When to Scale documentation](https://docs.nanobox.io/scaling/when-to-scale/).
