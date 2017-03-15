# New Relic

[New Relic](https://newrelic.com/) provides deep application analytics and can be incredibly useful when tuning your PHP application. Installing and using New Relic with PHP in an app deployed with Nanobox is simple, but does require a few steps to setup.

## Include the New Relic Extension & Package
To use New Relic with PHP, you need to include both the New Relic PHP extension and the New Relic daemon. This is done in your `boxfile.yml`.

```yaml
run.config:
  engine: php
  engine.config:
    extensions:
      - newrelic
  extra_packages:
    - newrelic
```

## Add a New Relic Config File
New Relic needs a `newrelic.cfg` file that handles configuration of the New Relic Daemon. Include the following `newrelic.cfg` in the root of your project.

<div class="meta" data-class="configFile" data-run="newrelic.cfg"></div>

```conf
license_key=${NEWRELIC_LICENSE}
loglevel=info
logfile=/data/var/log/newrelic/nrsysmond.log
#proxy=
#ssl=true
#hostname=nanobox
#docker_connection=
#docker_cert_path=
#docker_cert=
#docker_key=
#docker_cacert=
#ssl_ca_bundle=
#ssl_ca_path=
#pidfile=/data/var/run/newrelic/nrsysmond.pid
#collector_host=collector.newrelic.com
#labels=
#disable_nfs=false
#disable_docker=false
#cgroup_root=
#ignore_reclaimable=true
#host_root=/
```

**Note:** The `NEWRELIC_LICENSE` environment variable will need to be added to populate the `license_key` in the `newrelic.cfg`. More info [below](#add-your-new-relic-license-key).

## Add a New Relic Start Command
When deployed to running servers, the New Relic daemon needs to be started. To do this, add a `newrelic` start command to your web configuration in your `boxfile.yml` that starts the New Relic daemon using the `newrelic.cfg` in your repo. You can also add a `log_watch` to include New Relic logs in your app's log stream.

```yaml
web.site:
  start:
    # The New Relic Start command is in
    # addition to your app's start command
    newrelic: newrelic-daemon -f -c newrelic.cfg
    app: php-server

  # Optional New Relic Log Watch
  log_watch:
    newrelic: /data/var/log/newrelic/nrsysmond.log
```

## Add Your New Relic License Key
In order to connect your app to your New Relic account you need to include your [New Relic license key](https://docs.newrelic.com/docs/accounts-partnerships/accounts/account-setup/license-key) as an environment variable. The following command assumes you've already [added your live app as a remote](./launch-your-app#deploy-your-app):

```bash
nanobox evar add NEWRELIC_LICENSE="yournewreliclicense"
```

### Inject Your New Relic License Key on Deploy
Add transform hooks to the `deploy.config` section of your `boxfile.yml` to inject your New Relic license key into your `php.ini` and your `newrelic.cfg`.

```yaml
deploy.config:
  transform:
    - sed -i -e "s:license=.*:license=\"${NEWRELIC_LICENSE}\":" -e "s:appname=.*:appname=\"${APP_NAME}\":" /data/etc/php.*/newrelic.ini
    - sed -i "s:license_key=.*:license_key=\"${NEWRELIC_LICENSE}\":" /app/newrelic.cfg
```

## Consolidated boxfile.yml
This is what the `boxfile.yml` would look like with all the changes outlined above:

```yaml
run.config:
  engine: php
  engine.config:
    extensions:
      - newrelic
  extra_packages:
    - newrelic

deploy.config:
  transform:
    - sed -i -e "s:license=.*:license=\"${NEWRELIC_LICENSE}\":" -e "s:appname=.*:appname=\"${APP_NAME}\":" /data/etc/php.*/newrelic.ini
    - sed -i "s:license_key=.*:license_key=\"${NEWRELIC_LICENSE}\":" /app/newrelic.cfg

web.site:
  start:
    newrelic: newrelic-daemon -f -c newrelic.cfg
    app: php-server
  log_watch:
    newrelic: /data/var/log/newrelic/nrsysmond.log
```

With everything in place, you're ready to deploy:

```bash
nanobox deploy
```




## Configure the New Relic PHP Extension
The following settings are used to configure the [PHP New Relic Agent](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration).

#### newrelic\_capture\_params
Sets the [`newrelic.capture_params` setting](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-capture_params).

```yaml
run.config:
  engine.config:
    newrelic_capture_params: false
```

#### newrelic\_ignored\_params
Sets the [`newrelic.ignored_params` setting](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-ignored_params).

```yaml
run.config:
  engine.config:
    newrelic_ignored_params: ''
```

#### newrelic_loglevel
Sets the [`newrelic.loglevel` setting](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-loglevel).

```yaml
run.config:
  engine.config:
    newrelic_loglevel: 'info'
```

#### newrelic_framework
Sets the [`newrelic.framework` setting](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-framework).

```yaml
run.config:
  engine.config:
    newrelic_framework: 'laravel'
```

#### newrelic\_framework\_drupal\_modules
Sets the [`newrelic.framework.drupal.modules` setting](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-framework-drupal-modules).

```yaml
run.config:
  engine.config:
    newrelic_framework_drupal_modules: true
```

#### newrelic\_browser\_monitoring\_auto\_instrument
Sets the [`newrelic.browser_monitoring_auto_instrument` setting](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-autorum).

```yaml
run.config:
  engine.config:
    newrelic_browser_monitoring_auto_instrument: true
```

#### newrelic\_transaction\_tracer\_enabled
Sets the [`newrelic.transaction_tracer.enabled` setting](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-tt-enable).

```yaml
run.config:
  engine.config:
    newrelic_transaction_tracer_enabled: true
```

#### newrelic\_transaction\_tracer\_detail
Sets the [`newrelic.transaction_tracer.detail` setting](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-tt-detail).

```yaml
run.config:
  engine.config:
    newrelic_transaction_tracer_detail: 1
```

#### newrelic\_transaction\_tracer\_record\_sql
Sets the [`newrelic.transaction_tracer.record_sql` setting](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-tt-sql).

```yaml
run.config:
  engine.config:
    newrelic_transaction_tracer_record_sql: 'obfuscated'
```

#### newrelic\_transaction\_tracer\_threshold
Sets the [`newrelic.transaction_tracer.threshold` setting](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-tt-threshold).

```yaml
run.config:
  engine.config:
    newrelic_transaction_tracer_threshold: 'apdex_f'
```

#### newrelic\_transaction\_tracer\_explain\_threshold
Sets the [`newrelic.transaction_tracer.explain_threshold` setting](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-tt-epthreshold).

```yaml
run.config:
  engine.config:
    newrelic_transaction_tracer_explain_threshold: '500'
```

#### newrelic\_transaction\_tracer\_stack\_trace\_threshold
Sets the [`newrelic.transaction_tracer.stack_trace_threshold` setting](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-tt-stthreshold).

```yaml
run.config:
  engine.config:
    newrelic_transaction_tracer_stack_trace_threshold: '500'
```

#### newrelic\_transaction\_tracer\_slow\_sql
Sets the [`newrelic.transaction_tracer.slow_sql` setting](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-tt-slowsql).

```yaml
run.config:
  engine.config:
    newrelic_transaction_tracer_slow_sql: true
```

#### newrelic\_transaction\_tracer\_custom
Sets the [`newrelic.transaction_tracer.custom` setting](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-tt-custom).

```yaml
run.config:
  engine.config:
    newrelic_transaction_tracer_custom: ''
```

#### newrelic\_error\_collector\_enabled
Sets the [`newrelic.error_collector.enabled` setting](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-err-enabled).

```yaml
run.config:
  engine.config:
    newrelic_error_collector_enabled: true
```

#### newrelic\_error\_collector\_record\_database\_errors
Sets the [`newrelic.error_collector.record_database_errors` setting](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-err-db).

```yaml
run.config:
  engine.config:
    newrelic_error_collector_record_database_errors: true
```

#### newrelic\_webtransaction\_name\_files
Sets the [`newrelic.webtransaction.name.files` setting](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-wt-files).

```yaml
run.config:
  engine.config:
    newrelic_webtransaction_name_files: ''
```

#### newrelic\_webtransaction\_name\_functions
Sets the [`newrelic.webtransaction.name.functions` setting](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-wt-funcs).

```yaml
run.config:
  engine.config:
    newrelic_webtransaction_name_functions: ''
```

#### newrelic\_webtransaction\_name\_remove\_trailing\_path
Sets the [`newrelic.webtransaction.name_remove_trailing_path` setting](https://docs.newrelic.com/docs/agents/php-agent/configuration/php-agent-configuration#inivar-wt-remove-path).

```yaml
run.config:
  engine.config:
    newrelic_webtransaction_name_remove_trailing_path: false
```
