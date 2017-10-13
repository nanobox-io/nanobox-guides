# Connect to Elasticsearch

When using Nanobox, projects are meant to be both portable and secure. In order for your project to be both, you should use environment variables in your Elasticsearch connections.

## Use Environment Variables to Connect
In your app's connection to Elasticsearch, use your component's [auto-generated environment variables](#auto-generated-environment-variables).

##### Node.js Example
```javascript
var elasticsearch=require('elasticsearch');

var client = new elasticsearch.Client( {  
  hosts: [
    'https://' + process.env.DATA_ELASTICSEARCH_HOST + ':9200/'
  ]
});
```

## Auto-Generated Environment Variables
When data components are provisioned with Nanobox, unique connection credentials are generated along with environment variables for each. Secure connections to Elasticsearch only require a host and port.

**Port**  
The port will always be the default Elasticsearch port `9200`.

**Name**  
The database name is provided by Nanobox and will always be `gonano`.

#### Variable Naming Convention
Environment variable names/keys are generated using the ID of the Elasticsearch component in your boxfile.yml - data.mongo, data.whatever, etc. Letters are capitalized and special characters are replaced with underscores. For example:

```yaml
data.elasticsearch => DATA_ELASTICSEARCH
data.es      => DATA_ES
data.cthulu  => DATA_CTHULU
```

Using this convention, environment variables for each required credential are generated.

```yaml
# Component ID
data.elasticsearch

# Auto-Generated Environment Variables
DATA_ELASTICSEARCH_HOST
```

## Viewing Environment Variables
To view the environment variables in your app, you can use the `evar ls` command.

```bash
# View environment variables in local environment
nanobox evar ls local
```
